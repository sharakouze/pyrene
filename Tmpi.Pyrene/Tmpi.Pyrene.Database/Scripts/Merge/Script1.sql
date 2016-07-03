
-- Fourn : plusieurs contacts ?
-- PersonneProfil : a quoi sert le site ?
-- Gen_Cptcompteur : double emploi avec Gen_Cpt_MNumero ?


set xact_abort on;

--
-- SOCIETES
--

begin transaction;

set identity_insert [Core].[Societe] on;

merge into [Core].[Societe] as target
using (
	select CleSociete,
		CodSociete,
		LibSociete,
		TxtSociete,
		EstActif,
		DatCreation,
		coalesce(DatModif,DatCreation) as DatModif,
		CleExterne as IdExterne,
		AdrRue,
		AdrCode,
		AdrVille,
		NumTelep,
		NumTelec,
		NumEmail
	from [SA_TMPI].[Gen_SocSociete]
	where CleSociete>0
) as source
on (target.CleSociete=source.CleSociete)
when not matched by target
then -- insert new rows
	insert (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, IdExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail)
	values (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, IdExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail);
	
set identity_insert [Core].[Societe] off;

-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
if not exists (select * from [Core].[Societe])
begin
	insert into [Core].[Societe] (CodSociete, LibSociete, EstActif, DatCreation, DatModif)
	values ('SOC', 'Société par défaut', 1, GETDATE(), GETDATE());
end;

commit transaction;

--
-- SECTEURS
--

begin transaction;

declare @w_CleSocieteDef int;
select @w_CleSocieteDef=min(CleSociete) from [Core].[Societe];

set identity_insert [Core].[SocieteSecteur] on;

merge into [Core].[SocieteSecteur] as target
using (
	select CleSecteur,
		CodSecteur,
		LibSecteur,
		TxtSecteur,
		EstActif,
		DatCreation,
		coalesce(DatModif,DatCreation) as DatModif,
		CleExterne as IdExterne,
		coalesce(nullif(CleSociete,0),@w_CleSocieteDef) as CleSociete,
		AdrRue,
		AdrCode,
		AdrVille,
		NumTelep,
		NumTelec,
		NumEmail
	from [SA_TMPI].[Gen_SocSecteur]
	where CleSecteur>0
) as source
on (target.CleSecteur=source.CleSecteur)
when not matched by target
then -- insert new rows
	insert (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, IdExterne,
		CleSociete, AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail)
	values (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, IdExterne,
		CleSociete, AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail);
	
set identity_insert [Core].[SocieteSecteur] off;

-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
if not exists (select * from [Core].[SocieteSecteur])
begin
	insert into [Core].[SocieteSecteur] (CodSecteur, LibSecteur, EstActif, DatCreation, DatModif, CleSociete)
	values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleSocieteDef);
end;

commit transaction;

--
-- SERVICES
--

begin transaction;

declare @w_CleSecteurDef int;
select @w_CleSecteurDef=min(CleSecteur) from [Core].[SocieteSecteur];

set identity_insert [Core].[SocieteService] on;

merge into [Core].[SocieteService] as target
using (
	select CleService,
		CodService,
		LibService,
		TxtService,
		EstActif,
		DatCreation,
		coalesce(DatModif,DatCreation) as DatModif,
		CleExterne as IdExterne,
		coalesce(nullif(CleSecteur,0),@w_CleSecteurDef) as CleSecteur,
		AdrRue,
		AdrCode,
		AdrVille,
		NumTelep,
		NumTelec,
		NumEmail
	from [SA_TMPI].[Gen_SocService]
	where CleService>0
) as source
on (target.CleService=source.CleService)
when not matched by target
then -- insert new rows
	insert (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, IdExterne,
		CleSecteur, AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail)
	values (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, IdExterne,
		CleSecteur, AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail);
	
set identity_insert [Core].[SocieteService] off;

commit transaction;

--
-- PERSONNE + SIGNATURE
--

begin transaction;

set identity_insert [Core].[Personne] on;

merge into [Core].[Personne] as target
using (
	select ClePersonne,
		CodPersonne,
		PrePersonne,
		NomPersonne,
		null as TxtPersonne,
		EstActif,
		DatCreation,
		coalesce(DatModif,DatCreation) as DatModif,
		CleExterne as IdExterne,
		CleGenre as TypGenre,
		NumTelep,
		NumEmail
	from [SA_TMPI].[Gen_SocPersonne]
	where ClePersonne>0
) as source
on (target.ClePersonne=source.ClePersonne)
when not matched by target
then -- insert new rows
	insert (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, IdExterne,
		TypGenre, NumTelep, NumEmail)
	values (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, IdExterne,
		TypGenre, NumTelep, NumEmail);
	
set identity_insert [Core].[Personne] off;

merge into [Core].[PersonneSignature] as target
using (
	select ClePersonne,
		ImgPersonne as ImgSignature,
		case lower(ImgFormat)
			when 'jpg' then 'image/jpeg'
			else 'image/'+lower(ImgFormat)
		end as ImgType
	from [SA_TMPI].[Gen_SocPersonne]
	where ClePersonne>0
		and ImgPersonne is not null
) as source
on (target.ClePersonne=source.ClePersonne)
when not matched by target
then -- insert new rows
	insert (ClePersonne, ImgSignature, ImgType)
	values (ClePersonne, ImgSignature, ImgType);

commit transaction;

--
-- PROFILS UTILISATEURS
--

begin transaction;

set identity_insert [Core].[PersonneProfil] on;

merge into [Core].[PersonneProfil] as target
using (
	select ClePersonneProfil as CleProfil,
		ClePersonne,
		CodProfil,
		CleSociete,
		CleSecteur,
		CleService
	from [SA_TMPI].[Gen_SocPersonneProfil]
	where ClePersonne>0
) as source
on (target.CleProfil=source.CleProfil)
when not matched by target
then -- insert new rows
	insert (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService)
	values (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService);
	
set identity_insert [Core].[PersonneProfil] off;

commit transaction;

--
-- FOURNISSEURS
--

begin transaction;

set identity_insert [Core].[Fourn] on;

merge into [Core].[Fourn] as target
using (
	select CleFourn, 
		CodFourn,
		LibFourn,
		TxtFourn,
		1 as EstActif,
		isnull(DatSaisie,getdate()) as DatCreation,
		isnull(DatSaisie,getdate()) as DatModif,
		null as IdExterne,
		AdrRue,
		AdrCode,
		AdrVille,
		NumTelep,
		NumTelec,
		NumEmail,
		CodCompta,
		NumClient,
		NomContact,
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
	from [SA_TMPI].[t_Fourn]
	where CleFourn>0
) as source
on (target.CleFourn=source.CleFourn)
when not matched by target
then -- insert new rows
	insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, IdExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail, CodCompta, NumClient, NomContact,
		NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
		TypModeReglement, EstEnvoiMailBonCde, CleProprietaire)
	values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, IdExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail, CodCompta, NumClient, NomContact,
		NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
		TypModeReglement, EstEnvoiMailBonCde, CleProprietaire);
	
set identity_insert [Core].[Fourn] off;

commit transaction;

--
-- COORDONNEES BANQUAIRES FOURNISSEUR
--

begin transaction;

set identity_insert [Core].[FournBanque] on;

merge into [Core].[FournBanque] as target
using (
	select CleRib as CleBanque,
		CleFourn,
		LibBanque,
		RibBanque,
		RibGuichet,
		RibCompte,
		RibCle,
		EstDefaut
	from [SA_TMPI].[Gen_FouRib]
	where CleFourn>0
		and RibBanque is not null
) as source
on (target.CleBanque=source.CleBanque)
when not matched by target
then -- insert new rows
	insert (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut)
	values (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut);
	
set identity_insert [Core].[FournBanque] off;

commit transaction;

--
-- EXERCICES
--

begin transaction;

set identity_insert [Core].[Exercice] on;

merge into [Core].[Exercice] as target
using (
	select CleExercice,
		CodExercice,
		LibExercice,
		TxtExercice,
		DatCreation,
		coalesce(DatModif,DatCreation) as DatModif,
		CleExterne as IdExterne,
		NivExercice,
		DatDebut,
		DatFin
	from [SA_TMPI].[Gen_DivExercice]
	where CleExercice>0
) as source
on (target.CleExercice=source.CleExercice)
when not matched by target
then -- insert new rows
	insert (CleExercice, CodExercice, LibExercice, TxtExercice, DatCreation, DatModif, IdExterne,
		NivExercice, DatDebut, DatFin)
	values (CleExercice, CodExercice, LibExercice, TxtExercice, DatCreation, DatModif, IdExterne,
		NivExercice, DatDebut, DatFin);
	
set identity_insert [Core].[Exercice] off;

commit transaction;

--
-- COMPTEURS ET MODELES DE NUMEROTATION
--

begin transaction;

set identity_insert [Core].[Compteur] on;

merge into [Core].[Compteur] as target
using (
	select N.CleMNumero as CleCompteur, 
		N.CodMNumero as CodCompteur, 
		N.LibMNumero as LibCompteur, 
		N.TxtMNumero as TxtCompteur, 
		N.EstActif, 
		N.DatCreation,
		coalesce(N.DatModif,N.DatCreation) as DatModif,
		N.CleExterne as IdExterne,
		N.TypCompteur, 
		null as CleSociete, 
		coalesce(N.CleSecteur,C.CleSecteur) as CleSecteur, 
		coalesce(N.CleService,C.CleService) as CleService, 
		C.TypPeriodicite, 
		N.ValPrefixe1, 
		N.ValDate1 as ValFormatDate1, 
		N.ValPrefixe2, 
		N.NbrCaractere, 
		N.ValSuffixe1, 
		N.ValDate2 as ValFormatDate2,  
		N.ValSuffixe2, 
		N.TxtSubstitution as LstFormatMois
	from [SA_TMPI].[Gen_CptCompteur] C inner join [SA_TMPI].[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
	where C.CleCompteur>0 and N.CleMNumero>0
) as source
on (target.CleCompteur=source.CleCompteur)
when not matched by target
then -- insert new rows
	insert (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, IdExterne,
		TypCompteur, CleSociete, CleSecteur, CleService, TypPeriodicite, 
		ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrCaractere, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois)
	values (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, IdExterne,
		TypCompteur, CleSociete, CleSecteur, CleService, TypPeriodicite, 
		ValPrefixe1, ValFormatDate1, ValPrefixe2, NbrCaractere, ValSuffixe1, ValFormatDate2, ValSuffixe2, LstFormatMois);
	
set identity_insert [Core].[Compteur] off;

-- mise à jour eventuelle de CleSociete
update CPT
set CPT.CleSociete=SEC.CleSociete
from [Core].[Compteur] CPT inner join [Core].[SocieteSecteur] SEC on CPT.CleSecteur=SEC.CleSecteur
where CPT.CleSociete is null and CPT.CleSecteur is not null;

commit transaction;

