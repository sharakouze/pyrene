/* REMARQUES :
- Sociétes et Secteurs :
Fusion avec GenService, qui permet une arborescence récursive.

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
Transformation de RIB en IBAN pour les coordonées banquaires.
Suppression de CleProprietaire.

- Exercice :
NivExercice devient EstActif.
*/

SET XACT_ABORT ON;
SET NOCOUNT ON;

GO

:setvar SourceSchemaName "[CG66_PYRENE_DLB].[SA_TMPI]"

GO

--
-- CONSTANTES POUR LA REPRISE
--

:setvar CleSecteurBase "1"
:setvar CleServiceBase "2"

GO

--
-- DIVERS TESTS AVANT REPRISE
--

BEGIN
	declare @MaxCleSociete int;
	declare @MaxCleSecteur int;
	
	select @MaxCleSociete=max(CleSociete) from $(SourceSchemaName).[Gen_SocSociete];
	IF (@MaxCleSociete>=$(CleSecteurBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSociete].[CleSociete] est trop elevée. Changez la valeur de la constante CleSecteurBase pour continuer la reprise.';
		RETURN;
	END;

	select @MaxCleSecteur=max(CleSecteur) from $(SourceSchemaName).[Gen_SocSecteur];
	IF (@MaxCleSecteur>=$(CleServiceBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSecteur].[CleSecteur] est trop elevée. Changez la valeur de la constante CleServiceBase pour continuer la reprise.';
		RETURN;
	END;
END;

GO

--
-- FONCTIONS TEMP
--

:r TempFunctions.sql

GO

--
-- SOCIETES, SECTEURS et SERVICES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenService] ON;

	merge into [GenService] as target
	using (
		select [dbo].[TMP_SOC_TO_SERVICE](S.CleSociete, null, null) as CleService,
			ltrim(rtrim(S.CodSociete)) as CodService,
			ltrim(rtrim(S.LibSociete)) as LibService,
			ltrim(rtrim(S.TxtSociete)) as TxtService,
			S.EstActif,
			S.DatCreation,
			coalesce(S.DatModif,S.DatCreation) as DatModif,
			S.CleExterne as CodExterne,
			cast(null as int) as CleServiceParent,
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
			ltrim(rtrim(CodSecteur)) as CodService,
			ltrim(rtrim(LibSecteur)) as LibService,
			ltrim(rtrim(TxtSecteur)) as TxtService,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
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
			ltrim(rtrim(CodService)) as CodService,
			ltrim(rtrim(LibService)) as LibService,
			ltrim(rtrim(TxtService)) as TxtService,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
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
		insert (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenService] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenService] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
		select ClePersonne,
			ltrim(rtrim(CodPersonne)) as CodPersonne,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtPersonne,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
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
		insert (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenPersonne] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonne] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenPersonneSignature] as target
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
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonneProfil] ON;

	merge into [GenPersonneProfil] as target
	using (
		select PRF.ClePersonneProfil as CleProfil,
			PRF.ClePersonne,
			PRF.CodProfil,
			[dbo].[TMP_SOC_TO_SERVICE](PRF.CleSociete, PRF.CleSecteur, PRF.CleService) as CleService,
			P.DatCreation,
			coalesce(P.DatModif,P.DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne
		where PRF.ClePersonne>0
	) as source
	on (target.CleProfil=source.CleProfil)
	when not matched by target
	then -- insert new rows
		insert (CleProfil, ClePersonne, CodProfil, CleService, DatCreation, DatModif)
		values (CleProfil, ClePersonne, CodProfil, CleService, DatCreation, DatModif);
	
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
		select N.CleMNumero as CleCompteur, 
			ltrim(rtrim(N.CodMNumero)) as CodCompteur, 
			ltrim(rtrim(N.LibMNumero)) as LibCompteur, 
			ltrim(rtrim(N.TxtMNumero)) as TxtCompteur, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			C.TypPeriodicite, 
			[dbo].[TMP_SOC_TO_SERVICE](null, coalesce(N.CleSecteur,C.CleSecteur), coalesce(N.CleService,C.CleService)) as CleService,
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
	on (target.CleCompteur=source.CleCompteur)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero)
		values (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero);
	
	SET IDENTITY_INSERT [GenCompteur] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenCompteur] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenCompteurValeur] as target
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
		select CleMandat,
			ltrim(rtrim(CodMandat)) as CodMandat,
			ltrim(rtrim(LibMandat)) as LibMandat,
			ltrim(rtrim(TxtMandat)) as TxtMandat,
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
	on (target.CleMandat=source.CleMandat)
	when not matched by target
	then -- insert new rows
		insert (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [GenMandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandat] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandatMandataire] ON;

	merge into [GenMandatMandataire] as target
	using (
		select CleMdtMandataire as CleMandataire,
			CleMandat,
			CleMandataire as ClePersonne,
			[dbo].[TMP_SOC_TO_SERVICE](CleSociete, CleSecteur, CleService) as CleService,
			EstSuspendu
		from $(SourceSchemaName).[GenP_MdtMandataire]
		where CleMandat>0
	) as source
	on (target.CleMandataire=source.CleMandataire)
	when not matched by target
	then -- insert new rows
		insert (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu)
		values (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu);
	
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
		select CleTVA,
			ltrim(rtrim(CodTVA)) as CodTVA,
			ltrim(rtrim(LibTVA)) as LibTVA,
			ltrim(rtrim(TxtTVA)) as TxtTVA,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.CleTVA=source.CleTVA)
	when not matched by target
	then -- insert new rows
		insert (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA)
		values (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA);
	
	SET IDENTITY_INSERT [GenTVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenTVA] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
		select CleFourn, 
			ltrim(rtrim(CodFourn)) as CodFourn,
			ltrim(rtrim(LibFourn)) as LibFourn,
			ltrim(rtrim(TxtFourn)) as TxtFourn,
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
	on (target.CleFourn=source.CleFourn)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde)
		values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde);
	
	SET IDENTITY_INSERT [GenFourn] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFourn] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
		select * from [dbo].[TEMP_SPLIT](@NomContact, ' ');

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

	merge into [GenFournContact] as target
	using (
		select FC.CleFourn,
			isnull(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtContact, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif,
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
		insert (CleFourn, NomContact, PreContact, TxtContact, DatCreation, DatModif,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (CleFourn, NomContact, PreContact, TxtContact, DatCreation, DatModif,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction);

	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @CodePaysIBAN char(2) = 'FR';

	SET IDENTITY_INSERT [GenFournBanque] ON;

	merge into [GenFournBanque] as target
	using (
		select FR.CleRib as CleBanque,
			FR.CleFourn as CleFourn,
			[dbo].[TEMP_BBAN_TO_IBAN](FR.RibBanque+FR.RibGuichet+FR.RibCompte+FR.RibCle, @CodePaysIBAN) as CodIBAN,
			@CodePaysIBAN as CodBIC,
			FR.LibBanque as LibEtablissement,
			FR.EstDefaut,
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif
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
		insert (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif)
		values (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif);
	
	SET IDENTITY_INSERT [GenFournBanque] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFournBanque] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
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
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			DatDebut,
			DatFin
		from $(SourceSchemaName).[Gen_DivExercice]
		where CleExercice>0
	) as source
	on (target.CleExercice=source.CleExercice)
	when not matched by target
	then -- insert new rows
		insert (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin)
		values (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin);
	
	SET IDENTITY_INSERT [GenExercice] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenExercice] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
END CATCH;

GO



-- NETTOYAGE

DROP FUNCTION [dbo].[TMP_BBAN_TO_IBAN];
GO
DROP FUNCTION [dbo].[TMP_SPLIT];
GO
DROP FUNCTION [dbo].[TMP_SOC_TO_SERVICE];
GO
