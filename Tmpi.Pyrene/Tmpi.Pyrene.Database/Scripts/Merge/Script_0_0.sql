/* REMARQUES :
- Profils d'utilisateurs :
A quoi sert le lien sur Gen_SocSite ? Suppression de CleSite.

- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.

- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.

- Fourn :
Implementer plusieurs contacts ?

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
		select S.CleSociete,
			S.CodSociete,
			S.LibSociete,
			S.TxtSociete,
			S.EstActif,
			S.DatCreation,
			coalesce(S.DatModif,S.DatCreation) as DatModif,
			S.CleExterne as CodExterne,
			S.AdrRue,
			S.AdrCode,
			S.AdrVille,
			P.LibPays as AdrPays,
			S.NumTelep,
			S.NumTelec as NumFax,
			S.NumEmail
		from $(SourceSchemaName).[Gen_SocSociete] S left join $(SourceSchemaName).[Gen_Pays] P on S.ClePays=P.ClePays
		where S.CleSociete>0
	) as source
	on (target.CleSociete=source.CleSociete)
	when not matched by target
	then -- insert new rows
		insert (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);

	SET IDENTITY_INSERT [GenSociete] OFF;

	-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSociete])
	begin
		insert into [GenSociete] (CodSociete, LibSociete, EstActif, DatCreation, DatModif)
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

	declare @w_CleSocieteDef int;
	select @w_CleSocieteDef=min(CleSociete) from [GenSociete];

	SET IDENTITY_INSERT [GenSocieteSecteur] ON;

	merge into [GenSocieteSecteur] as target
	using (
		select CleSecteur,
			CodSecteur,
			LibSecteur,
			TxtSecteur,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSociete,0),@w_CleSocieteDef) as CleSociete,
			AdrRue,
			AdrCode,
			AdrVille,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocSecteur]
		where CleSecteur>0
	) as source
	on (target.CleSecteur=source.CleSecteur)
	when not matched by target
	then -- insert new rows
		insert (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
			CleSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
			CleSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenSocieteSecteur] OFF;

	-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSocieteSecteur])
	begin
		insert into [GenSocieteSecteur] (CodSecteur, LibSecteur, EstActif, DatCreation, DatModif, CleSociete)
		values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleSocieteDef);
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSocieteSecteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleSecteurDef int;
	select @w_CleSecteurDef=min(CleSecteur) from [GenSocieteSecteur];

	SET IDENTITY_INSERT [GenSocieteService] ON;

	merge into [GenSocieteService] as target
	using (
		select CleService,
			CodService,
			LibService,
			TxtService,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSecteur,0),@w_CleSecteurDef) as CleSecteur,
			AdrRue,
			AdrCode,
			AdrVille,
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
			CleSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
			CleSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenSocieteService] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSocieteService] OFF;
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
		select ClePersonne,
			CodPersonne,
			PrePersonne,
			NomPersonne,
			null as TxtPersonne,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			CleGenre as TypGenre,
			NumTelep,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypGenre, NumTelep, NumEmail)
		values (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypGenre, NumTelep, NumEmail);
	
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
		select ClePersonne,
			ImgPersonne as ImgSignature,
			case lower(ImgFormat)
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
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonneProfil] ON;

	merge into [GenPersonneProfil] as target
	using (
		select ClePersonneProfil as CleProfil,
			ClePersonne,
			CodProfil,
			CleSociete,
			CleSecteur,
			CleService
		from $(SourceSchemaName).[Gen_SocPersonneProfil]
		where ClePersonne>0
	) as source
	on (target.CleProfil=source.CleProfil)
	when not matched by target
	then -- insert new rows
		insert (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService)
		values (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService);
	
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
		select N.CleMNumero as CleCompteur, 
			N.CodMNumero as CodCompteur, 
			N.LibMNumero as LibCompteur, 
			N.TxtMNumero as TxtCompteur, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			null as CleSociete, 
			coalesce(N.CleSecteur,C.CleSecteur) as CleSecteur, 
			coalesce(N.CleService,C.CleService) as CleService, 
			C.TypPeriodicite, 
			N.ValPrefixe1, 
			N.ValDate1 as ValFormatDate1, 
			N.ValPrefixe2, 
			N.NbrCaractere as NbrDigit, 
			N.ValSuffixe1, 
			N.ValDate2 as ValFormatDate2,  
			N.ValSuffixe2, 
			N.TxtSubstitution as LstFormatMois
		from $(SourceSchemaName).[Gen_CptCompteur] C inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0 and N.CleMNumero>0
	) as source
	on (target.CleCompteur=source.CleCompteur)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, CleSociete, CleSecteur, CleService, TypPeriodicite, 
			ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrDigit, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois)
		values (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, CleSociete, CleSecteur, CleService, TypPeriodicite, 
			ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrDigit, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois);
	
	SET IDENTITY_INSERT [GenCompteur] OFF;

	-- mise à jour eventuelle de CleSociete
	update CPT
	set CPT.CleSociete=SEC.CleSociete
	from [GenCompteur] CPT inner join [GenSocieteSecteur] SEC on CPT.CleSecteur=SEC.CleSecteur
	where CPT.CleSociete is null and CPT.CleSecteur is not null;

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
		select CleMandat,
			CodMandat,
			LibMandat, 
			TxtMandat,
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
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandatMandataire] ON;

	merge into [GenMandatMandataire] as target
	using (
		select CleMdtMandataire as CleMandataire,
			CleMandat,
			CleMandataire as ClePersonne,
			CleSociete,
			CleSecteur,
			CleService,
			EstSuspendu
		from $(SourceSchemaName).[GenP_MdtMandataire]
		where CleMandat>0
	) as source
	on (target.CleMandataire=source.CleMandataire)
	when not matched by target
	then -- insert new rows
		insert (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu)
		values (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu);
	
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;
	THROW;
END CATCH;

GO

--
-- TIERS et CONTACTS
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenTiers] ON;

	SET IDENTITY_INSERT [GenTiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenTiers] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenTiersContact] ON;

	merge into [GenTiersContact] as target
	using (
		select C.CleContact, 
			C.CleTiers, 
			C.NomContact, 
			C.TxtContact, 
			C.NumTelep, 
			C.NumEmail, 
			nullif(C.CleGenre,0) as TypGenre, 
			F.CodFonction
		from $(SourceSchemaName).[Gen_TrsContact] C left join $(SourceSchemaName).[Gen_Trs_Fonction] F on C.CleFonction=F.CleFonction
		where C.CleTiers>0
	) as source
	on (target.CleContact=source.CleContact)
	when not matched by target
	then -- insert new rows
		insert (CleContact, CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction)
		values (CleContact, CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction);
	
	SET IDENTITY_INSERT [GenTiersContact] OFF;

	merge into [GenTiersContact] as target
	using (
		select CleTiers, 
			NomContact, 
			null as TxtContact, 
			null as NumTelep, 
			null as NumEmail, 
			null as TypGenre, 
			null as CodFonction
		from $(SourceSchemaName).[Gen_TrsTiers]
		where CleTiers>0
			and NomContact is not null
	) as source
	on (target.CleTiers=source.CleTiers and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction)
		values (CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction);

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenTiersContact] OFF;
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
		select CleTVA,
			CodTVA,
			LibTVA,
			TxtTVA,
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
		select CleFourn, 
			CodFourn,
			LibFourn,
			TxtFourn,
			1 as EstActif,
			coalesce(DatSaisie,getdate()) as DatCreation,
			coalesce(DatSaisie,getdate()) as DatModif,
			null as CodExterne,
			AdrRue,
			AdrCode,
			AdrVille,
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
			CleProprietaire
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
	) as source
	on (target.CleFourn=source.CleFourn)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde, CleProprietaire)
		values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde, CleProprietaire);
	
	SET IDENTITY_INSERT [GenFourn] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFourn] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenFournContact] as target
	using (
		select CleFourn,
			NomContact,
			null as TxtContact, 
			null as NumTelep, 
			null as NumEmail, 
			null as TypGenre, 
			null as CodFonction
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
			and NomContact is not null
	) as source
	on (target.CleFourn=source.CleFourn and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction)
		values (CleFourn, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction);

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
		select CleRib as CleBanque,
			CleFourn,
			LibBanque,
			RibBanque,
			RibGuichet,
			RibCompte,
			RibCle,
			EstDefaut
		from $(SourceSchemaName).[Gen_FouRib]
		where CleFourn>0
			and RibBanque is not null
	) as source
	on (target.CleBanque=source.CleBanque)
	when not matched by target
	then -- insert new rows
		insert (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut)
		values (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut);
	
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
		select CleExercice,
			CodExercice,
			LibExercice,
			TxtExercice,
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
	THROW;
END CATCH;

GO
