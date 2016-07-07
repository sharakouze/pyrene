/* REMARQUES :
*/

set xact_abort on;

GO

--
-- ATELIERS et RESPONSABLES
--

begin transaction;

set identity_insert [Gmao].[Atelier] on;

merge into [Gmao].[Atelier] as target
using (
	select CleAtelier,
		CodAtelier,
		LibAtelier,
		TxtAtelier,
		1 as EstActif,
		DatSaisie as DatCreation,
		DatSaisie as DatModif
	from [SA_TMPI].[t_EquAtelier]
	where CleAtelier>0
) as source
on (target.CleAtelier=source.CleAtelier)
when not matched by target
then -- insert new rows
	insert (CleAtelier, CodAtelier, LibAtelier, TxtAtelier, EstActif, DatCreation, DatModif)
	values (CleAtelier, CodAtelier, LibAtelier, TxtAtelier, EstActif, DatCreation, DatModif);
	
set identity_insert [Gmao].[Atelier] off;

commit transaction;

begin transaction;

merge into [Gmao].[AtelierResponsable] as target
using (
	select CleAtelier,
		ClePersonne
	from [SA_TMPI].[t_EquAtelierRespon]
	where CleAtelier>0 and ClePersonne>0
) as source
on (target.CleAtelier=source.CleAtelier and target.ClePersonne=source.ClePersonne)
when not matched by target
then -- insert new rows
	insert (CleAtelier, ClePersonne)
	values (CleAtelier, ClePersonne);

commit transaction;

GO

--
-- EQUIPEMENTS
--

begin transaction;
commit transaction;

GO
