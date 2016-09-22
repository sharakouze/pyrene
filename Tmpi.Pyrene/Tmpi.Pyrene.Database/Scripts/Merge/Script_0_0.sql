/* REMARQUES :
- Profils d'utilisateurs :
A quoi sert le lien sur Gen_SocSite ? Suppression de CleSite.

- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.
Doublons ????

- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.

- Fourn :
Plusieurs contacts possibles.

- Exercice :
NivExercice devient EstActif.
*/

SET XACT_ABORT ON;

GO

:setvar SourceSchemaName "[SA_TMPI]"

GO

--
-- SOCIETES, SECTEURS et SERVICES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenSociete] ON;

	merge into [GenSociete] as target
	using (
		select S.CleSociete as Id,
			ltrim(rtrim(S.CodSociete)) as CodObjet,
			ltrim(rtrim(S.LibSociete)) as LibObjet,
			ltrim(rtrim(S.TxtSociete)) as TxtObjet,
			S.EstActif,
			S.DatCreation,
			coalesce(S.DatModif,S.DatCreation) as DatModif,
			S.CleExterne as CodExterne,
			S.AdrRue,
			S.AdrCode,
			S.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			S.NumTelep,
			S.NumTelec as NumFax,
			S.NumEmail
		from $(SourceSchemaName).[Gen_SocSociete] S left join $(SourceSchemaName).[Gen_Pays] P on S.ClePays=P.ClePays
		where S.CleSociete>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);

	SET IDENTITY_INSERT [GenSociete] OFF;

	-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSociete])
	begin
		insert into [GenSociete] (CodObjet, LibObjet, EstActif, DatCreation, DatModif)
		values ('SOC', 'Société par défaut', 1, GETDATE(), GETDATE());
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSociete] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleGenSocieteDef int;
	select @w_CleGenSocieteDef=min(Id) from [GenSociete];

	SET IDENTITY_INSERT [GenSecteur] ON;

	merge into [GenSecteur] as target
	using (
		select CleSecteur as Id,
			ltrim(rtrim(CodSecteur)) as CodObjet,
			ltrim(rtrim(LibSecteur)) as LibObjet,
			ltrim(rtrim(TxtSecteur)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSociete,0),@w_CleGenSocieteDef) as CleGenSociete,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocSecteur]
		where CleSecteur>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenSecteur] OFF;

	-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSecteur])
	begin
		insert into [GenSecteur] (CodObjet, LibObjet, EstActif, DatCreation, DatModif, CleGenSociete)
		values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleGenSocieteDef);
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSecteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleGenSecteurDef int;
	select @w_CleGenSecteurDef=min(Id) from [GenSecteur];

	SET IDENTITY_INSERT [GenService] ON;

	merge into [GenService] as target
	using (
		select CleService as Id,
			ltrim(rtrim(CodService)) as CodObjet,
			ltrim(rtrim(LibService)) as LibObjet,
			ltrim(rtrim(TxtService)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSecteur,0),@w_CleGenSecteurDef) as CleGenSecteur,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocService]
		where CleService>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenService] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenService] OFF;
	THROW;
END CATCH;

GO

--
-- PERSONNES, SIGNATURES et PROFILS UTILISATEURS
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonne] ON;

	merge into [GenPersonne] as target
	using (
		select ClePersonne as Id,
			ltrim(rtrim(CodPersonne)) as CodObjet,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			CleGenre as TypCivilite,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenPersonne] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonne] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenPersonneSignature] as target
	using (
		select ClePersonne as CleGenPersonne,
			ImgPersonne as ImgSignature,
			case lower(ImgFormat)
				when null then 'image/jpeg'
				when '' then 'image/jpeg'
				when 'jpg' then 'image/jpeg'
				else 'image/'+lower(ImgFormat)
			end as TypMime
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
			and ImgPersonne is not null
	) as source
	on (target.CleGenPersonne=source.CleGenPersonne)
	when not matched by target
	then -- insert new rows
		insert (CleGenPersonne, ImgSignature, TypMime)
		values (CleGenPersonne, ImgSignature, TypMime);

	COMMIT;
END TRY
BEGIN CATCH
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonneProfil] ON;

	merge into [GenPersonneProfil] as target
	using (
		select ClePersonneProfil as Id,
			ClePersonne as CleGenPersonne,
			CodProfil as CodObjet,
			CleSociete as CleGenSociete,
			CleSecteur as CleGenSecteur,
			CleService as CleGenService
		from $(SourceSchemaName).[Gen_SocPersonneProfil]
		where ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenPersonne, CodObjet, CleGenSociete, CleGenSecteur, CleGenService)
		values (Id, CleGenPersonne, CodObjet, CleGenSociete, CleGenSecteur, CleGenService);
	
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;
	THROW;
END CATCH;

GO

--
-- COMPTEURS, MODELES DE NUMEROTATION et VALEUR DES COMPTEURS
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenCompteur] ON;

	merge into [GenCompteur] as target
	using (
		select N.CleMNumero as Id, 
			ltrim(rtrim(N.CodMNumero)) as CodObjet, 
			ltrim(rtrim(N.LibMNumero)) as LibObjet, 
			ltrim(rtrim(N.TxtMNumero)) as TxtObjet, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			C.TypPeriodicite, 
			null as CleGenSociete, 
			coalesce(N.CleSecteur,C.CleSecteur) as CleGenSecteur, 
			coalesce(N.CleService,C.CleService) as CleGenService, 
			isnull(N.ValPrefixe1,'')
				+isnull('{date:'+N.ValDate1+'}','')
				+isnull(N.ValPrefixe2,'')
				+'{num:'+replicate('0',N.NbrCaractere)+'}'
				+isnull(N.ValSuffixe1,'')
				+isnull('{date:'+N.ValDate2+'}','')
				+isnull(N.ValSuffixe2,'') as ValFormatNumero
		from $(SourceSchemaName).[Gen_CptCompteur] C inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0 and N.CleMNumero>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleGenSociete, CleGenSecteur, CleGenService, ValFormatNumero)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleGenSociete, CleGenSecteur, CleGenService, ValFormatNumero);
	
	SET IDENTITY_INSERT [GenCompteur] OFF;

	-- mise à jour eventuelle de CleGenSociete
	update CPT
	set CPT.CleGenSociete=SEC.CleGenSociete
	from [GenCompteur] CPT inner join [GenSecteur] SEC on CPT.CleGenSecteur=SEC.Id
	where CPT.CleGenSociete is null and CPT.CleGenSecteur is not null;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenCompteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenCompteurValeur] as target
	using (
		select N.CleMNumero as CleGenCompteur,
			V.CodPeriode as ValPeriode,
			V.ValCompteur
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N inner join $(SourceSchemaName).[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
		where N.CleMNumero>0
	) as source
	on (target.CleGenCompteur=source.CleGenCompteur and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CleGenCompteur, ValPeriode, ValCompteur)
		values (CleGenCompteur, ValPeriode, ValCompteur);
	
	COMMIT;
END TRY
BEGIN CATCH
	THROW;
END CATCH;

GO

--
-- MANDATS et MANDATAIRES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandat] ON;

	merge into [GenMandat] as target
	using (
		select CleMandat as Id,
			ltrim(rtrim(CodMandat)) as CodObjet,
			ltrim(rtrim(LibMandat)) as LibObjet,
			ltrim(rtrim(TxtMandat)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			null as CodExterne,
			TypMandat,
			NivMandat,
			NbrSignature,
			TxtMessage
		from $(SourceSchemaName).[GenP_MdtMandat]
		where CleMandat>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [GenMandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandat] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandatMandataire] ON;

	merge into [GenMandatMandataire] as target
	using (
		select CleMdtMandataire as Id,
			CleMandat as CleGenMandat,
			CleMandataire as CleGenPersonne,
			CleSociete as CleGenSociete,
			CleSecteur as CleGenSecteur,
			CleService as CleGenService,
			EstSuspendu
		from $(SourceSchemaName).[GenP_MdtMandataire]
		where CleMandat>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenMandat, CleGenPersonne, CleGenSociete, CleGenSecteur, CleGenService, EstSuspendu)
		values (Id, CleGenMandat, CleGenPersonne, CleGenSociete, CleGenSecteur, CleGenService, EstSuspendu);
	
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;
	THROW;
END CATCH;

GO

--
-- TVA
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenTVA] ON;

	merge into [GenTVA] as target
	using (
		select CleTVA as Id,
			ltrim(rtrim(CodTVA)) as CodObjet,
			ltrim(rtrim(LibTVA)) as LibObjet,
			ltrim(rtrim(TxtTVA)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, TauTVA)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, TauTVA);
	
	SET IDENTITY_INSERT [GenTVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenTVA] OFF;
	THROW;
END CATCH;

GO

--
-- FOURNISSEURS, CONTACTS et COORDONNEES BANQUAIRES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenFourn] ON;

	merge into [GenFourn] as target
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
			EstEnvoiMailBonCde,
			CleProprietaire as CleGenPersonne
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde, CleGenPersonne)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde, CleGenPersonne);
	
	SET IDENTITY_INSERT [GenFourn] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFourn] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @GenFournContact table (
		CleFourn int not null,
		NomContact varchar(100) not null,
		NomContact_Clean varchar(100),
		TypCivilite int null,
		NumEmail varchar(100)
	);
	
	insert into @GenFournContact ( CleFourn, NomContact )
	select CleFourn,
		ltrim(rtrim(NomContact)) as NomContact
	from $(SourceSchemaName).[t_Fourn]
	where CleFourn>0
		and NomContact is not null and NomContact<>'' and NomContact<>'INACTIF';

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
		select * from [fn_Split](@NomContact, ' ');

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

		declare @id int = null;

		select @id=id
		from @strings
		where txt like '%@%' and txt like '%.%';
		if (@id is not null)
		begin
			update @GenFournContact set NumEmail=(select txt from @strings where id=@id)
			where CleFourn=@CleFourn;
			delete @strings where id=@id;
		end;

		if ((select count(*) from @string)>0)
		begin
			update @GenFournContact set NomContact_Clean=stuff((select ' '+txt from @strings for XML PATH('')),1,1,'')
			where CleFourn=@CleFourn;
		end;

		fetch next from TEMP_CURSOR into @CleFourn, @NomContact;
    end;
 
    close TEMP_CURSOR;
    deallocate TEMP_CURSOR;

	merge into [GenFournContact] as target
	using (
		select CleFourn as CleGenFourn,
			isnull(NomContact_Clean,NomContact)) as NomContact,
			null as PreContact,
			null as TxtObjet, 
			null as NumTelep, 
			null as NumFax, 
			NumEmail, 
			TypCivilite, 
			null as CodFonction
		from @GenFournContact
	) as source
	on (target.CleGenFourn=source.CleGenFourn and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleGenFourn, NomContact, PreContact, TxtObjet, NumTelep, NumFax, NumEmail, TypCivilite, CodFonction)
		values (CleGenFourn, NomContact, PreContact, TxtObjet, NumTelep, NumFax, NumEmail, TypCivilite, CodFonction);

	COMMIT;
END TRY
BEGIN CATCH
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenFournBanque] ON;

	merge into [GenFournBanque] as target
	using (
		select CleRib as Id,
			CleFourn as CleGenFourn,
			isnull(RibBanque,'XXXXX')+isnull(RibGuichet,'XXXXX')+isnull(RibCompte,'XXXXXXXXXXX')+isnull(RibCle,'XX') as NumRib,
			LibBanque as LibEtablissement,
			EstDefaut
		from $(SourceSchemaName).[Gen_FouRib]
		where CleFourn>0
			and RibBanque is not null
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenFourn, NumRib, LibEtablissement, EstDefaut)
		values (Id, CleGenFourn, NumRib, LibEtablissement, EstDefaut);
	
	SET IDENTITY_INSERT [GenFournBanque] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFournBanque] OFF;
	THROW;
END CATCH;

GO

--
-- EXERCICES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenExercice] ON;

	merge into [GenExercice] as target
	using (
		select CleExercice as Id,
			CodExercice as CodObjet,
			LibExercice as LibObjet,
			TxtExercice as TxtObjet,
			case NivExercice
				when 9 then 1 -- Actif
				when 1 then 0 -- Inactif
				when 99 then 0 -- Cloturé
				else 0
			end as EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			DatDebut,
			DatFin
		from $(SourceSchemaName).[Gen_DivExercice]
		where CleExercice>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin);
	
	SET IDENTITY_INSERT [GenExercice] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenExercice] OFF;
	THROW;
END CATCH;

GO
