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
			S.CodSociete as CodObjet,
			S.LibSociete as LibObjet,
			S.TxtSociete as TxtObjet,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);

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
			CodSecteur as CodObjet,
			LibSecteur as LibObjet,
			TxtSecteur as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSociete,0),@w_CleGenSocieteDef) as CleGenSociete,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
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
			CodService as CodObjet,
			LibService as LibObjet,
			TxtService as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSecteur,0),@w_CleGenSecteurDef) as CleGenSecteur,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
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
			CodPersonne as CodObjet,
			PrePersonne,
			NomPersonne as LibObjet,
			null as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			CleGenre as TypGenre,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, PrePersonne, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypGenre, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, PrePersonne, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypGenre, NumTelep, NumFax, NumEmail);
	
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
			N.CodMNumero as CodObjet, 
			N.LibMNumero as LibObjet, 
			N.TxtMNumero as TxtObjet, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			null as CleGenSociete, 
			coalesce(N.CleSecteur,C.CleSecteur) as CleGenSecteur, 
			coalesce(N.CleService,C.CleService) as CleGenService, 
			C.TypPeriodicite, 
			isnull(N.ValPrefixe1,'')+isnull('{date:'+N.ValDate1+'}','')+isnull(N.ValPrefixe2,'')+'{num:'+N.NbrCaractere+'}'+isnull(N.ValSuffixe1,'')+isnull('{date:'+N.ValDate2+'}','')+isnull(N.ValSuffixe2,'') as ValFormatNumero, 
			N.TxtSubstitution as LstFormatMois
		from $(SourceSchemaName).[Gen_CptCompteur] C inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0 and N.CleMNumero>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, CleGenSociete, CleGenSecteur, CleGenService, TypPeriodicite, 
			ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrDigit, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, CleGenSociete, CleGenSecteur, CleGenService, TypPeriodicite, 
			ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrDigit, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois);
	
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
			CodMandat as CodObjet,
			LibMandat as LibObjet,
			TxtMandat as TxtObjet,
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
			CodTVA as CodObjet,
			LibTVA as LibObjet,
			TxtTVA as TxtObjet,
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
			CodFourn as CodObjet,
			LibFourn as LibObjet,
			TxtFourn as TxtObjet,
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
			CleProprietaire as CleGenPersonne
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde, CleGenPersonne)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
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

	merge into [GenFournContact] as target
	using (
		select CleFourn as CleGenFourn,
			NomContact as LibObjet,
			null as TxtObjet, 
			null as PreContact,
			null as NumTelep, 
			null as NumFax, 
			null as NumEmail, 
			null as TypGenre, 
			null as CodFonction
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
			and NomContact is not null
	) as source
	on (target.CleGenFourn=source.CleGenFourn and target.LibObjet=source.LibObjet)
	when not matched by target
	then -- insert new rows
		insert (CleGenFourn, LibObjet, TxtObjet, PreContact, NumTelep, NumFax, NumEmail, TypGenre, CodFonction)
		values (CleGenFourn, LibObjet, TxtObjet, PreContact, NumTelep, NumFax, NumEmail, TypGenre, CodFonction);

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
