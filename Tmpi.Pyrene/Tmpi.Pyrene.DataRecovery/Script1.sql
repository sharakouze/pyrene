/* REMARQUES :
- Sociétes et Secteurs :
Fusion avec Services, qui permet une arborescence récursive.

- Profils d'utilisateurs :
Suppression de CleSite. (a quoi sert Gen_SocSite ?)

- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.
Doublons ?
Le modele de numérotation est fusionné en 1 seul champ

- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.

- Fournisseurs :
Plusieurs contacts possibles.
Transformation de RIB en IBAN pour les coordonnées banquaires.
Suppression de CleProprietaire.

- Exercice :
NivExercice devient EstActif.
*/

--
-- DIVERS TESTS AVANT REPRISE
--

BEGIN
	declare @MaxCleSociete int;
	declare @MaxCleSecteur int;
	
	select @MaxCleSociete=max(CleSociete) from $(SourceSchemaName).[Gen_SocSociete];
	IF (@MaxCleSociete>=$(CleSecteurBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSociete].[CleSociete] est trop elevée. Changez la valeur de la constante CleSecteurBase pour continuer la reprise.';
		SET NOEXEC ON;
	END;

	select @MaxCleSecteur=max(CleSecteur) from $(SourceSchemaName).[Gen_SocSecteur];
	IF (@MaxCleSecteur>=$(CleServiceBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSecteur].[CleSecteur] est trop elevée. Changez la valeur de la constante CleServiceBase pour continuer la reprise.';
		SET NOEXEC ON;
	END;
END;

GO

--
-- SOCIETES, SECTEURS et SERVICES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Service] ON;

	merge into [Gen].[Service] as target
	using (
		select [dbo].[TMP_SOC_TO_SERVICE](S.CleSociete, null, null) as CleService,
			'SOC-'+ltrim(rtrim(S.CodSociete)) as CodService,
			ltrim(rtrim(S.LibSociete)) as LibService,
			ltrim(rtrim(S.TxtSociete)) as TxtService,
			S.EstActif,
			S.DatCreation,
			S.CleCreateur,
			S.DatModif as DatEdition,
			S.CleOperateur as CleEditeur,
			S.CleExterne as CodExterne,
			null as CleServiceParent,
			S.AdrRue,
			S.AdrCode,
			S.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			S.NumTelep,
			S.NumTelec as NumFax,
			S.NumEmail
		from $(SourceSchemaName).[Gen_SocSociete] S left join $(SourceSchemaName).[Gen_Pays] P on S.ClePays=P.ClePays
		where S.CleSociete>0
		union all
		select [dbo].[TMP_SOC_TO_SERVICE](null, CleSecteur, null) as CleService,
			'SEC-'+ltrim(rtrim(CodSecteur)) as CodService,
			ltrim(rtrim(LibSecteur)) as LibService,
			ltrim(rtrim(TxtSecteur)) as TxtService,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne,
			[dbo].[TMP_SOC_TO_SERVICE](CleSociete, null, null) as CleServiceParent,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocSecteur]
		where CleSecteur>0
		union all
		select [dbo].[TMP_SOC_TO_SERVICE](null, null, CleService) as CleService,
			'SVC-'+ltrim(rtrim(CodService)) as CodService,
			ltrim(rtrim(LibService)) as LibService,
			ltrim(rtrim(TxtService)) as TxtService,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne,
			[dbo].[TMP_SOC_TO_SERVICE](null, CleSecteur, null) as CleServiceParent,
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
	on (target.CleService=source.CleService)
	when not matched by target
	then -- insert new rows
		insert (CleService, CodService, LibService, TxtService, EstActif,
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleService, CodService, LibService, TxtService, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [Gen].[Service] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Service] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- PERSONNES, SIGNATURES et PROFILS UTILISATEURS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Personne] ON;

	merge into [Gen].[Personne] as target
	using (
		select ClePersonne,
			ltrim(rtrim(CodPersonne)) as CodPersonne,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtPersonne,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne,
			nullif(CleGenre,0) as TypCivilite,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif,
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [Gen].[Personne] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Personne] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[PersonneSignature] as target
	using (
		select ClePersonne,
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
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, ImgSignature, TypMime)
		values (ClePersonne, ImgSignature, TypMime);

	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[PersonneProfil] ON;

	merge into [Gen].[PersonneProfil] as target
	using (
		select PRF.ClePersonneProfil as CleProfil,
			PRF.ClePersonne,
			PRF.CodProfil,
			[dbo].[TMP_SOC_TO_SERVICE](PRF.CleSociete, PRF.CleSecteur, PRF.CleService) as CleService,
			P.DatCreation,
			P.CleCreateur,
			P.DatModif as DatEdition,
			P.CleOperateur as CleEditeur
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne
		where PRF.ClePersonne>0
	) as source
	on (target.CleProfil=source.CleProfil)
	when not matched by target
	then -- insert new rows
		insert (CleProfil, ClePersonne, CodProfil, CleService, 
			DatCreation, CleCreateur, DatEdition, CleEditeur)
		values (CleProfil, ClePersonne, CodProfil, CleService, 
			DatCreation, CleCreateur, DatEdition, CleEditeur);
	
	SET IDENTITY_INSERT [Gen].[PersonneProfil] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[PersonneProfil] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- COMPTEURS, MODELES DE NUMEROTATION et VALEUR DES COMPTEURS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Compteur] ON;

	merge into [Gen].[Compteur] as target
	using (
		select N.CleMNumero as CleCompteur, 
			ltrim(rtrim(N.CodMNumero)) as CodCompteur, 
			ltrim(rtrim(N.LibMNumero)) as LibCompteur, 
			ltrim(rtrim(N.TxtMNumero)) as TxtCompteur, 
			N.EstActif, 
			N.DatCreation,
			N.CleCreateur,
			N.DatModif as DatEdition,
			N.CleOperateur as CleEditeur,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			C.TypPeriodicite, 
			[dbo].[TMP_SOC_TO_SERVICE](null, coalesce(N.CleSecteur,C.CleSecteur), coalesce(N.CleService,C.CleService)) as CleService,
			coalesce(N.ValPrefixe1,'')
				+coalesce('{date:'+N.ValDate1+'}','')
				+coalesce(N.ValPrefixe2,'')
				+'{num:'+replicate('0',N.NbrCaractere)+'}'
				+coalesce(N.ValSuffixe1,'')
				+coalesce('{date:'+N.ValDate2+'}','')
				+coalesce(N.ValSuffixe2,'') as ValFormatNumero
		from $(SourceSchemaName).[Gen_CptCompteur] C inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0 and N.CleMNumero>0
	) as source
	on (target.CleCompteur=source.CleCompteur)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero)
		values (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero);
	
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[CompteurValeur] as target
	using (
		select N.CleMNumero as CleCompteur,
			V.CodPeriode as ValPeriode,
			V.ValCompteur
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N inner join $(SourceSchemaName).[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
		where N.CleMNumero>0
	) as source
	on (target.CleCompteur=source.CleCompteur and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, ValPeriode, ValCompteur)
		values (CleCompteur, ValPeriode, ValCompteur);
	
	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- MANDATS et MANDATAIRES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Mandat] ON;

	merge into [Gen].[Mandat] as target
	using (
		select CleMandat,
			ltrim(rtrim(CodMandat)) as CodMandat,
			ltrim(rtrim(LibMandat)) as LibMandat,
			ltrim(rtrim(TxtMandat)) as TxtMandat,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			null as CodExterne,
			TypMandat,
			NivMandat,
			NbrSignature,
			TxtMessage
		from $(SourceSchemaName).[GenP_MdtMandat]
		where CleMandat>0
	) as source
	on (target.CleMandat=source.CleMandat)
	when not matched by target
	then -- insert new rows
		insert (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif,
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[MandatMandataire] ON;

	merge into [Gen].[MandatMandataire] as target
	using (
		select MM.CleMdtMandataire as CleMandataire,
			MM.CleMandat,
			MM.CleMandataire as ClePersonne,
			[dbo].[TMP_SOC_TO_SERVICE](MM.CleSociete, MM.CleSecteur, MM.CleService) as CleService,
			MM.EstSuspendu,
			M.DatCreation,
			M.CleCreateur,
			M.DatModif as DatEdition,
			M.CleOperateur as CleEditeur
		from $(SourceSchemaName).[GenP_MdtMandataire] MM inner join $(SourceSchemaName).[GenP_MdtMandat] M on MM.CleMandat=M.CleMandat 
		where MM.CleMandat>0
	) as source
	on (target.CleMandataire=source.CleMandataire)
	when not matched by target
	then -- insert new rows
		insert (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu,
			DatCreation, CleCreateur, DatEdition, CleEditeur)
		values (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu,
			DatCreation, CleCreateur, DatEdition, CleEditeur);
	
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- TVA
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TVA] ON;

	merge into [Gen].[TVA] as target
	using (
		select CleTVA,
			ltrim(rtrim(CodTVA)) as CodTVA,
			ltrim(rtrim(LibTVA)) as LibTVA,
			ltrim(rtrim(TxtTVA)) as TxtTVA,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.CleTVA=source.CleTVA)
	when not matched by target
	then -- insert new rows
		insert (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne, TauTVA)
		values (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne, TauTVA);
	
	SET IDENTITY_INSERT [Gen].[TVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TVA] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- FOURNISSEURS, CONTACTS et COORDONNEES BANQUAIRES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Fourn] ON;

	merge into [Gen].[Fourn] as target
	using (
		select CleFourn, 
			ltrim(rtrim(CodFourn)) as CodFourn,
			ltrim(rtrim(LibFourn)) as LibFourn,
			ltrim(rtrim(TxtFourn)) as TxtFourn,
			1 as EstActif,
			coalesce(DatSaisie,getdate()) as DatCreation,
			coalesce(CleOperateur,0) as CleCreateur,
			DatSaisie as DatEdition,
			CleOperateur as CleEditeur,
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
	on (target.CleFourn=source.CleFourn)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde)
		values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
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
	SET NOEXEC ON;
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
		select FC.CleFourn,
			coalesce(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtContact, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.CleOperateur,0) as CleCreateur,
			F.DatSaisie as DatEdition,
			F.CleOperateur as CleEditeur,
			FC.NumTelep, 
			null as NumFax, 
			FC.NumEmail, 
			FC.TypCivilite, 
			null as LibFonction
		from @GenFournContact FC inner join $(SourceSchemaName).[t_Fourn] F on FC.CleFourn=F.CleFourn
	) as source
	on (target.CleFourn=source.CleFourn and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, NomContact, PreContact, TxtContact, 
			DatCreation, CleCreateur, DatEdition, CleEditeur,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (CleFourn, NomContact, PreContact, TxtContact, 
			DatCreation, CleCreateur, DatEdition, CleEditeur,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction);

	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @CodePaysIBAN char(2) = 'FR';

	SET IDENTITY_INSERT [Gen].[FournBanque] ON;

	merge into [Gen].[FournBanque] as target
	using (
		select FR.CleRib as CleBanque,
			FR.CleFourn as CleFourn,
			[dbo].[TMP_BBAN_TO_IBAN](FR.RibBanque+FR.RibGuichet+FR.RibCompte+FR.RibCle, @CodePaysIBAN) as CodIBAN,
			@CodePaysIBAN as CodBIC,
			FR.LibBanque as LibEtablissement,
			FR.EstDefaut,
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.CleOperateur,0) as CleCreateur,
			F.DatSaisie as DatEdition,
			F.CleOperateur as CleEditeur
		from $(SourceSchemaName).[Gen_FouRib] FR inner join $(SourceSchemaName).[t_Fourn] F on FR.CleFourn=F.CleFourn
		where FR.CleFourn>0
			and FR.RibBanque is not null 
			and FR.RibGuichet is not null 
			and FR.RibCompte is not null 
			and FR.RibCle is not null 
	) as source
	on (target.CleBanque=source.CleBanque)
	when not matched by target
	then -- insert new rows
		insert (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, 
			DatCreation, CleCreateur, DatEdition, CleEditeur)
		values (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, 
			DatCreation, CleCreateur, DatEdition, CleEditeur);
	
	SET IDENTITY_INSERT [Gen].[FournBanque] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[FournBanque] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- EXERCICES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Exercice] ON;

	merge into [Gen].[Exercice] as target
	using (
		select CleExercice,
			ltrim(rtrim(CodExercice)) as CodExercice,
			ltrim(rtrim(LibExercice)) as LibExercice,
			ltrim(rtrim(TxtExercice)) as TxtExercice,
			case NivExercice
				when 9 then 1 -- Actif
				when 1 then 0 -- Inactif
				when 99 then 0 -- Cloturé
				else 0
			end as EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne,
			DatDebut,
			DatFin
		from $(SourceSchemaName).[Gen_DivExercice]
		where CleExercice>0
	) as source
	on (target.CleExercice=source.CleExercice)
	when not matched by target
	then -- insert new rows
		insert (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			DatDebut, DatFin)
		values (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			DatDebut, DatFin);
	
	SET IDENTITY_INSERT [Gen].[Exercice] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Exercice] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- TYPE D'IDENTIFIANT
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TypeIdent] ON;

	merge into [Gen].[TypeIdent] as target
	using (
		select CleTypIdent as CleTypeIdent,
			ltrim(rtrim(CodTypIdent)) as CodTypeIdent,
			ltrim(rtrim(LibTypIdent)) as LibTypeIdent,
			ltrim(rtrim(TxtTypIdent)) as TxtTypeIdent,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_TrsTypIdent]
		where CleTypIdent>0
	) as source
	on (target.CleTypeIdent=source.CleTypeIdent)
	when not matched by target
	then -- insert new rows
		insert (CleTypeIdent, CodTypeIdent, LibTypeIdent, TxtTypeIdent, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne)
		values (CleTypeIdent, CodTypeIdent, LibTypeIdent, TxtTypeIdent, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- CIVILITE DES TIERS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[CiviliteTiers] ON;

	merge into [Gen].[CiviliteTiers] as target
	using (
		select CleCivilite as CleCiviliteTiers,
			ltrim(rtrim(CodCivilite)) as CodCiviliteTiers,
			ltrim(rtrim(LibCivilite)) as LibCiviliteTiers,
			ltrim(rtrim(TxtCivilite)) as TxtCiviliteTiers,
			coalesce(EstActif,1) as EstActif,
			coalesce(DatModif,getdate()) as DatCreation,
			coalesce(CleOperateur,0) as CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			null as CodExterne
		from $(SourceSchemaName).[Gen_Trs_Civilite]
		where CleCivilite>0
	) as source
	on (target.CleTypIdent=source.CleTypIdent)
	when not matched by target
	then -- insert new rows
		insert (CleCiviliteTiers, CodCiviliteTiers, LibCiviliteTiers, TxtCiviliteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne)
		values (CleCiviliteTiers, CodCiviliteTiers, LibCiviliteTiers, TxtCiviliteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[CiviliteTiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[CiviliteTiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO

--
-- PROPRIETES DES TIERS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[ProprieteTiers] ON;

	merge into [Gen].[ProprieteTiers] as target
	using (
		select ClePropriete as CleProprieteTiers,
			ltrim(rtrim(CodPropriete)) as CodProprieteTiers,
			ltrim(rtrim(LibPropriete)) as LibProprieteTiers,
			ltrim(rtrim(TxtPropriete)) as TxtProprieteTiers,
			1 as EstActif,
			getdate() as DatCreation,
			0 as CleCreateur,
			null as DatEdition,
			null as CleEditeur,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_Trs_Propriete]
		where ClePropriete>0
	) as source
	on (target.CleProprieteTiers=source.CleProprieteTiers)
	when not matched by target
	then -- insert new rows
		insert (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne)
		values (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[ProprieteTiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[ProprieteTiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO


-- NETTOYAGE

DROP FUNCTION [dbo].[TMP_BBAN_TO_IBAN];
GO
DROP FUNCTION [dbo].[TMP_SPLIT];
GO
DROP FUNCTION [dbo].[TMP_SOC_TO_SERVICE];
GO
