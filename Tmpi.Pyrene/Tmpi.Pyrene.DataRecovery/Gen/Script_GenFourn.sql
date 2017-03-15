/*
SOURCES :
- [t_Fourn]
- [Gen_FouRib]

REMARQUES :
- Fournisseurs :
Plusieurs contacts possibles.
Transformation de RIB en IBAN pour les coordonnées banquaires.
Suppression de CleProprietaire.
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Fourn] ON;

	merge into [Gen].[Fourn] as target
	using (
		select CleFourn as Id, 
			ltrim(rtrim(CodFourn)) as CodObjet,
			ltrim(rtrim(LibFourn)) as LibObjet,
			ltrim(rtrim(TxtFourn)) as TxtObjet,
			1 as EstActif,
			coalesce(DatSaisie,getdate()) as DatCreation,
			coalesce(DatSaisie,getdate()) as DatModif,
			null as CodExterne,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail,
			CodCompta,
			NumClient,
			NumTVAIntra,
			MntFPort,
			ValSPort as MntFPortGratuit,
			MntCommandeMin,
			DelLivraison,
			nullif(ValDelaiP,0) as DelPaiement,
			ValNote,
			nullif(CleModeReglement,0) as TypModeReglement,
			EstEnvoiMailBonCde
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde);
	
	SET IDENTITY_INSERT [Gen].[Fourn] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Fourn] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @GenFournContact table (
		CleFourn int not null,
		NomContact varchar(100) not null,
		NomContact_Clean varchar(100) null,
		TypCivilite int null,
		NumEmail varchar(100) null,
		NumTelep varchar(25) null
	);
	
	insert into @GenFournContact ( CleFourn, NomContact )
	select CleFourn,
		ltrim(rtrim(NomContact)) as NomContact
	from $(SourceSchemaName).[t_Fourn]
	where CleFourn>0
		and NomContact is not null
		and NomContact<>''
		and NomContact<>'INACTIF';

	declare TEMP_CURSOR cursor fast_forward for
	select CleFourn, NomContact
	from @GenFournContact;

	declare @CleFourn int;
	declare @NomContact varchar(100);

	declare @strings table ( id int, txt varchar(100) );
	
	open TEMP_CURSOR;
 
    fetch next from TEMP_CURSOR into @CleFourn, @NomContact;
    while @@FETCH_STATUS=0
	begin
		delete @strings;
		insert into @strings
		select * from [dbo].[TMP_SPLIT](@NomContact, ' ');

		-- extraction civilité
		declare @TypCivilite int = null;
		select top 1 @TypCivilite=case
			when txt='Monsieur' then 1
			when txt='M' then 1
			when txt='Mr' then 1
			when txt='M.' then 1
			when txt='Mr.' then 1
			when txt='Madame' then 2
			when txt='Mme' then 2
			when txt='Mme.' then 2
			when txt='Mademoiselle' then 3
			when txt='Melle' then 3
			when txt='Melle.' then 3
			else null end
		from @strings;
		if (@TypCivilite is not null)
		begin
			update @GenFournContact set TypCivilite=@TypCivilite
			where CleFourn=@CleFourn;

			delete @strings where id=1;
		end;

		declare @id int;

		-- extraction email
		set @id = null;
		select @id=id from @strings where txt like '%@%' and txt like '%.%';
		if (@id is not null)
		begin
			update @GenFournContact set NumEmail=(select txt from @strings where id=@id)
			where CleFourn=@CleFourn;
			update @GenFournContact set NumEmail=right(NumEmail,len(NumEmail)-1)
			where CleFourn=@CleFourn and left(NumEmail,1) not like '[a-zA-Z]';
			update @GenFournContact set NumEmail=left(NumEmail,len(NumEmail)-1)
			where CleFourn=@CleFourn and right(NumEmail,1) not like '[a-zA-Z]';

			delete @strings where id=@id;
		end;

		-- extraction téléphone
		set @id = null;
		select @id=id from @strings where len(txt)>=10 and isnumeric(replace(txt,'.',''))=1;
		if (@id is not null)
		begin
			update @GenFournContact set NumTelep=(select txt from @strings where id=@id)
			where CleFourn=@CleFourn;

			delete @strings where id=@id;
		end;

		if ((select count(*) from @strings)>0)
		begin
			update @GenFournContact set NomContact_Clean=stuff((select ' '+txt from @strings for xml path('')),1,1,'')
			where CleFourn=@CleFourn;
		end;

		fetch next from TEMP_CURSOR into @CleFourn, @NomContact;
    end;
 
    close TEMP_CURSOR;
    deallocate TEMP_CURSOR;

	merge into [Gen].[FournContact] as target
	using (
		select FC.CleFourn as FournId,
			coalesce(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtObjet, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif,
			FC.NumTelep, 
			null as NumFax, 
			FC.NumEmail, 
			FC.TypCivilite, 
			null as LibFonction
		from @GenFournContact FC
		inner join $(SourceSchemaName).[t_Fourn] F on FC.CleFourn=F.CleFourn
		where FC.CleFourn>0
	) as source
	on (target.FournId=source.FournId and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (FournId, NomContact, PreContact, TxtObjet, DatCreation, DatModif, 
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (FournId, NomContact, PreContact, TxtObjet, DatCreation, DatModif, 
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction);

	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @CodePaysIBAN char(2) = 'FR';

	SET IDENTITY_INSERT [Gen].[FournBanque] ON;

	merge into [Gen].[FournBanque] as target
	using (
		select FR.CleRib as Id,
			FR.CleFourn as FournId,
			[dbo].[TMP_BBAN_TO_IBAN](FR.RibBanque+FR.RibGuichet+FR.RibCompte+FR.RibCle, @CodePaysIBAN) as CodIBAN,
			@CodePaysIBAN as CodBIC,
			FR.LibBanque as LibEtablissement,
			FR.EstDefaut,
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif
		from $(SourceSchemaName).[Gen_FouRib] FR
		inner join $(SourceSchemaName).[t_Fourn] F on FR.CleFourn=F.CleFourn
		where FR.CleFourn>0
			and FR.RibBanque is not null 
			and FR.RibGuichet is not null 
			and FR.RibCompte is not null 
			and FR.RibCle is not null 
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, FournId, CodIBAN, CodBIC, LibEtablissement, EstDefaut, 
			DatCreation, DatModif)
		values (Id, FournId, CodIBAN, CodBIC, LibEtablissement, EstDefaut, 
			DatCreation, DatModif);
	
	SET IDENTITY_INSERT [Gen].[FournBanque] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[FournBanque] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
