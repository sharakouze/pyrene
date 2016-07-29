/* REMARQUES :
- Fourn :
Implementer plusieurs contacts ?
*/

set xact_abort on;

GO

--
-- TVA
--

begin transaction;

set identity_insert [Sto].[TVA] on;

merge into [Sto].[TVA] as target
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
	from [SA_TMPI].[Gen_DivTVA]
	where CleTVA>0
) as source
on (target.CleTVA=source.CleTVA)
when not matched by target
then -- insert new rows
	insert (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA)
	values (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA);
	
set identity_insert [Sto].[TVA] off;

commit transaction;

GO

--
-- FOURNISSEURS et COORDONNEES BANQUAIRES
--

begin transaction;

set identity_insert [Sto].[Fourn] on;

merge into [Sto].[Fourn] as target
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
	insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail, CodCompta, NumClient, NomContact,
		NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
		TypModeReglement, EstEnvoiMailBonCde, CleProprietaire)
	values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
		AdrRue, AdrCode, AdrVille, NumTelep, NumTelec, NumEmail, CodCompta, NumClient, NomContact,
		NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
		TypModeReglement, EstEnvoiMailBonCde, CleProprietaire);
	
set identity_insert [Sto].[Fourn] off;

commit transaction;

begin transaction;

merge into [Sto].[FournContact] as target
using (
	select CleFourn,
		NomContact
	from [SA_TMPI].[t_Fourn]
	where CleFourn>0
		and NomContact is not null
) as source
on (target.CleBanque=source.CleBanque)
when not matched by target
then -- insert new rows
	insert (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut)
	values (CleBanque, CleFourn, LibBanque, RibBanque, RibGuichet, RibCompte, RibCle, EstDefaut);

commit transaction;

begin transaction;

set identity_insert [Sto].[FournBanque] on;

merge into [Sto].[FournBanque] as target
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
	
set identity_insert [Sto].[FournBanque] off;

commit transaction;

GO
