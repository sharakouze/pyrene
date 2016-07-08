/* REMARQUES :
- Profils d'utilisateurs :
A quoi sert le lien sur Gen_SocSite ? Suppression de CleSite.

- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.

- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.
*/

set xact_abort on;

GO

--
-- SOCIETES, SECTEURS et SERVICES
--

begin transaction;

set identity_insert [GEN].[Societe] on;

merge into [GEN].[Societe] as target
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
	from [SA_TMPI].[Gen_SocSociete] S left join [SA_TMPI].[Gen_Pays] P on S.ClePays=P.ClePays
	where S.CleSociete>0
) as source
on (target.CleSociete=source.CleSociete)
when not matched by target
then -- insert new rows
	insert (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
		AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
	values (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
		AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);

set identity_insert [GEN].[Societe] off;

-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
if not exists (select * from [GEN].[Societe])
begin
	insert into [GEN].[Societe] (CodSociete, LibSociete, EstActif, DatCreation, DatModif)
	values ('SOC', 'Société par défaut', 1, GETDATE(), GETDATE());
end;

commit transaction;

begin transaction;

declare @w_CleSocieteDef int;
select @w_CleSocieteDef=min(CleSociete) from [GEN].[Societe];

set identity_insert [GEN].[SocieteSecteur] on;

merge into [GEN].[SocieteSecteur] as target
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
	from [SA_TMPI].[Gen_SocSecteur]
	where CleSecteur>0
) as source
on (target.CleSecteur=source.CleSecteur)
when not matched by target
then -- insert new rows
	insert (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
		CleSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
	values (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
		CleSociete, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
set identity_insert [GEN].[SocieteSecteur] off;

-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
if not exists (select * from [GEN].[SocieteSecteur])
begin
	insert into [GEN].[SocieteSecteur] (CodSecteur, LibSecteur, EstActif, DatCreation, DatModif, CleSociete)
	values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleSocieteDef);
end;

commit transaction;

begin transaction;

declare @w_CleSecteurDef int;
select @w_CleSecteurDef=min(CleSecteur) from [GEN].[SocieteSecteur];

set identity_insert [GEN].[SocieteService] on;

merge into [GEN].[SocieteService] as target
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
	from [SA_TMPI].[Gen_SocService]
	where CleService>0
) as source
on (target.CleService=source.CleService)
when not matched by target
then -- insert new rows
	insert (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
		CleSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail)
	values (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
		CleSecteur, AdrRue, AdrCode, AdrVille, AdrPays, NumTelep, NumFax, NumEmail);
	
set identity_insert [GEN].[SocieteService] off;

commit transaction;

GO

--
-- PERSONNES, SIGNATURES et PROFILS UTILISATEURS
--

begin transaction;

set identity_insert [GEN].[Personne] on;

merge into [GEN].[Personne] as target
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
	from [SA_TMPI].[Gen_SocPersonne]
	where ClePersonne>0
) as source
on (target.ClePersonne=source.ClePersonne)
when not matched by target
then -- insert new rows
	insert (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
		TypGenre, NumTelep, NumEmail)
	values (ClePersonne, CodPersonne, PrePersonne, NomPersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
		TypGenre, NumTelep, NumEmail);
	
set identity_insert [GEN].[Personne] off;

commit transaction;

begin transaction;

merge into [GEN].[PersonneSignature] as target
using (
	select ClePersonne,
		ImgPersonne as ImgSignature,
		case lower(ImgFormat)
			when 'jpg' then 'image/jpeg'
			else 'image/'+lower(ImgFormat)
		end as TypMime
	from [SA_TMPI].[Gen_SocPersonne]
	where ClePersonne>0
		and ImgPersonne is not null
) as source
on (target.ClePersonne=source.ClePersonne)
when not matched by target
then -- insert new rows
	insert (ClePersonne, ImgSignature, TypMime)
	values (ClePersonne, ImgSignature, TypMime);

commit transaction;

begin transaction;

set identity_insert [GEN].[PersonneProfil] on;

merge into [GEN].[PersonneProfil] as target
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
	
set identity_insert [GEN].[PersonneProfil] off;

commit transaction;

GO

--
-- COMPTEURS, MODELES DE NUMEROTATION et VALEUR DES COMPTEURS
--

begin transaction;

set identity_insert [GEN].[Compteur] on;

merge into [GEN].[Compteur] as target
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
	from [SA_TMPI].[Gen_CptCompteur] C inner join [SA_TMPI].[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
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
	
set identity_insert [GEN].[Compteur] off;

-- mise à jour eventuelle de CleSociete
update CPT
set CPT.CleSociete=SEC.CleSociete
from [GEN].[Compteur] CPT inner join [GEN].[SocieteSecteur] SEC on CPT.CleSecteur=SEC.CleSecteur
where CPT.CleSociete is null and CPT.CleSecteur is not null;

commit transaction;

begin transaction;

merge into [GEN].[CompteurValeur] as target
using (
	select N.CleMNumero as CleCompteur,
		V.CodPeriode as ValPeriode,
		V.ValCompteur
	from [SA_TMPI].[Gen_Cpt_MNumero] N inner join [SA_TMPI].[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
	where N.CleMNumero>0
) as source
on (target.CleCompteur=source.CleCompteur and target.ValPeriode=source.ValPeriode)
when not matched by target
then -- insert new rows
	insert (CleCompteur, ValPeriode, ValCompteur)
	values (CleCompteur, ValPeriode, ValCompteur);
	
commit transaction;

GO

--
-- MANDATS et MANDATAIRES
--

begin transaction;

set identity_insert [GEN].[Mandat] on;

merge into [GEN].[Mandat] as target
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
	from [SA_TMPI].[GenP_MdtMandat]
	where CleMandat>0
) as source
on (target.CleMandat=source.CleMandat)
when not matched by target
then -- insert new rows
	insert (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
		TypMandat, NivMandat, NbrSignature, TxtMessage)
	values (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
		TypMandat, NivMandat, NbrSignature, TxtMessage);
	
set identity_insert [GEN].[Mandat] off;

commit transaction;

begin transaction;

set identity_insert [GEN].[MandatMandataire] on;

merge into [GEN].[MandatMandataire] as target
using (
	select CleMdtMandataire as CleMandataire,
		CleMandat,
		CleMandataire as ClePersonne,
		CleSociete,
		CleSecteur,
		CleService,
		EstSuspendu
	from [SA_TMPI].[GenP_MdtMandataire]
	where CleMandat>0
) as source
on (target.CleMandataire=source.CleMandataire)
when not matched by target
then -- insert new rows
	insert (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu)
	values (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu);
	
set identity_insert [GEN].[MandatMandataire] off;

commit transaction;

GO

--
-- TIERS et CONTACTS
--

begin transaction;
commit transaction;

begin transaction;

set identity_insert [GEN].[TiersContact] on;

merge into [GEN].[TiersContact] as target
using (
	select C.CleContact, 
		C.CleTiers, 
		C.NomContact, 
		C.TxtContact, 
		C.NumTelep, 
		C.NumEmail, 
		nullif(C.CleGenre,0) as TypGenre, 
		F.CodFonction
	from [SA_TMPI].[Gen_TrsContact] C left join [SA_TMPI].[Gen_Trs_Fonction] F on C.CleFonction=F.CleFonction
	where C.CleTiers>0
) as source
on (target.CleContact=source.CleContact)
when not matched by target
then -- insert new rows
	insert (CleContact, CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction)
	values (CleContact, CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction);
	
set identity_insert [GEN].[TiersContact] off;

merge into [GEN].[TiersContact] as target
using (
	select CleTiers, 
		NomContact, 
		null as TxtContact, 
		null as NumTelep, 
		null as NumEmail, 
		null as TypGenre, 
		null as CodFonction
	from [SA_TMPI].[Gen_TrsTiers]
	where CleTiers>0
		and NomContact is not null
) as source
on (target.CleTiers=source.CleTiers and target.NomContact=source.NomContact)
when not matched by target
then -- insert new rows
	insert (CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction)
	values (CleTiers, NomContact, TxtContact, NumTelep, NumEmail, TypGenre, CodFonction);

commit transaction;

GO
