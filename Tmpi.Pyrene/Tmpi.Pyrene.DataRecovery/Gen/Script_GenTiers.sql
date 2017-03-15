/*
SOURCES :
- [Gen_TrsTiers]
- [Gen_TrsTiersIdent]

REMARQUES :
ClePropriete1, ClePropriete et ClePropriete3 vont dans la table enfant TiersPropriete.
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Tiers] ON;

	merge into [Gen].[Tiers] as target
	using (
		select T1.CleTiers,
			ltrim(rtrim(T1.NumTiers)) as NumTiers,
			ltrim(rtrim(T1.NomTiers)) as NomTiers,
			ltrim(rtrim(T1.TxtTiers)) as TxtTiers,
			coalesce(T1.EstActif,1) as EstActif,
			coalesce(T1.DatCreation,getdate()) as DatCreation,
			T1.DatModif,
			T1.CleExterne as CodExterne,
			T1.AdrRue,
			T1.AdrCode,
			T1.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			T1.NumTelep,
			T1.NumTelec as NumFax,
			T1.NumEmail,
			T1.AdrLatitude,
			T1.AdrLongitude,
			T1.AdrVilleSuite as AdrCommuneSuite,
			T1.CodCompta,
			T2.CleTiers as CleTiersPrincipal,
			C.CleCivilite as CleCiviliteTiers
		from $(SourceSchemaName).[Gen_TrsTiers] T1
		left join $(SourceSchemaName).[Gen_Pays] P on T1.ClePays=P.ClePays and P.ClePays>0
		left join $(SourceSchemaName).[Gen_TrsTiers] T2 on T1.ClePointP=T2.CleTiers and T2.CleTiers>0
		left join $(SourceSchemaName).[Gen_Trs_Civilite] C on T1.CleCivilite=C.CleCivilite and C.CleCivilite>0
		where T1.CleTiers>0
	) as source
	on (target.CleTiers=source.CleTiers)
	when not matched by target
	then -- insert new rows
		insert (CleTiers, NumTiers, NomTiers, TxtTiers, EstActif, 
			DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, AdrLatitude, AdrLongitude, AdrCommuneSuite,
			CodCompta, CleTiersPrincipal, CleCiviliteTiers)
		values (CleTiers, NumTiers, NomTiers, TxtTiers, EstActif, 
			DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, AdrLatitude, AdrLongitude, AdrCommuneSuite,
			CodCompta, CleTiersPrincipal, CleCiviliteTiers);
	
	SET IDENTITY_INSERT [Gen].[Tiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Tiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[TiersPropriete] as target
	using (
		select T.CleTiers as TiersId,
			P1.ClePropriete as ProprieteTiersId
		from $(SourceSchemaName).[Gen_TrsTiers] T
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P1 on T.ClePropriete1=P1.ClePropriete and P1.ClePropriete>0
		where T.CleTiers>0
			and P1.ClePropriete is not null
		union
		select T.CleTiers as TiersId,
			P2.ClePropriete as ProprieteTiersId
		from $(SourceSchemaName).[Gen_TrsTiers] T
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P2 on T.ClePropriete2=P2.ClePropriete and P2.ClePropriete>0
		where T.CleTiers>0
			and P2.ClePropriete is not null
		union
		select T.CleTiers as TiersId,
			P3.ClePropriete as ProprieteTiersId
		from $(SourceSchemaName).[Gen_TrsTiers] T
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P3 on T.ClePropriete3=P3.ClePropriete and P3.ClePropriete>0
		where T.CleTiers>0
			and P3.ClePropriete is not null
	) as source
	on (target.TiersId=source.TiersId and target.ProprieteTiersId=source.ProprieteTiersId)
	when not matched by target
	then -- insert new rows
		insert (TiersId, ProprieteTiersId)
		values (TiersId, ProprieteTiersId);

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

	declare @GenTiersContact table (
		CleTiers int not null,
		NomContact varchar(100) not null,
		NomContact_Clean varchar(100) null,
		TypCivilite int null,
		NumEmail varchar(100) null,
		NumTelep varchar(25) null
	);
	
	insert into @GenTiersContact ( CleTiers, NomContact )
	select CleTiers,
		ltrim(rtrim(NomContact)) as NomContact
	from $(SourceSchemaName).[t_Tiers]
	where CleTiers>0
		and NomContact is not null
		and NomContact<>''
		and NomContact<>'INACTIF';

	declare TEMP_CURSOR cursor fast_forward for
	select CleTiers, NomContact
	from @GenTiersContact;

	declare @CleTiers int;
	declare @NomContact varchar(100);

	declare @strings table ( id int, txt varchar(100) );
	
	open TEMP_CURSOR;
 
    fetch next from TEMP_CURSOR into @CleTiers, @NomContact;
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
			update @GenTiersContact set TypCivilite=@TypCivilite
			where CleTiers=@CleTiers;

			delete @strings where id=1;
		end;

		declare @id int;

		-- extraction email
		set @id = null;
		select @id=id from @strings where txt like '%@%' and txt like '%.%';
		if (@id is not null)
		begin
			update @GenTiersContact set NumEmail=(select txt from @strings where id=@id)
			where CleTiers=@CleTiers;
			update @GenTiersContact set NumEmail=right(NumEmail,len(NumEmail)-1)
			where CleTiers=@CleTiers and left(NumEmail,1) not like '[a-zA-Z]';
			update @GenTiersContact set NumEmail=left(NumEmail,len(NumEmail)-1)
			where CleTiers=@CleTiers and right(NumEmail,1) not like '[a-zA-Z]';

			delete @strings where id=@id;
		end;

		-- extraction téléphone
		set @id = null;
		select @id=id from @strings where len(txt)>=10 and isnumeric(replace(txt,'.',''))=1;
		if (@id is not null)
		begin
			update @GenTiersContact set NumTelep=(select txt from @strings where id=@id)
			where CleTiers=@CleTiers;

			delete @strings where id=@id;
		end;

		if ((select count(*) from @strings)>0)
		begin
			update @GenTiersContact set NomContact_Clean=stuff((select ' '+txt from @strings for xml path('')),1,1,'')
			where CleTiers=@CleTiers;
		end;

		fetch next from TEMP_CURSOR into @CleTiers, @NomContact;
    end;
 
    close TEMP_CURSOR;
    deallocate TEMP_CURSOR;

	merge into [Gen].[TiersContact] as target
	using (
		select FC.CleTiers as TiersId,
			coalesce(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtObjet, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			F.DatSaisie as DatModif,
			FC.NumTelep, 
			null as NumFax, 
			FC.NumEmail, 
			FC.TypCivilite, 
			null as LibFonction
		from @GenTiersContact FC
		inner join $(SourceSchemaName).[t_Tiers] F on FC.CleTiers=F.CleTiers
	) as source
	on (target.TiersId=source.TiersId and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (TiersId, NomContact, PreContact, TxtObjet, DatCreation, DatModif, 
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (TiersId, NomContact, PreContact, TxtObjet, DatCreation, DatModif, 
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

	SET IDENTITY_INSERT [Gen].[TiersIdent] ON;

	merge into [Gen].[TiersIdent] as target
	using (
		select CleTiers as TiersId,
			CleTypIdent as TypeIdentId,
			NumIdent
		from $(SourceSchemaName).[Gen_TrsTiersIdent]
		where CleTiers>0
			and NumIdent is not null
	) as source
	on (target.TiersId=source.TiersId and target.TypeIdentId=source.TypeIdentId)
	when not matched by target
	then -- insert new rows
		insert (TiersId, TypeIdentId, NumIdent)
		values (TiersId, TypeIdentId, NumIdent);
	
	SET IDENTITY_INSERT [Gen].[TiersIdent] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TiersIdent] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
