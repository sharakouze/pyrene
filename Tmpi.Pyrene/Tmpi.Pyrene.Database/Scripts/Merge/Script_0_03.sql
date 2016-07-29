/* REMARQUES :
- Exercice :
NivExercice devient EstActif.
*/

set xact_abort on;

GO

--
-- EXERCICES
--

begin transaction;

set identity_insert [Bud].[Exercice] on;

merge into [Bud].[Exercice] as target
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
	from [SA_TMPI].[Gen_DivExercice]
	where CleExercice>0
) as source
on (target.CleExercice=source.CleExercice)
when not matched by target
then -- insert new rows
	insert (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
		DatDebut, DatFin)
	values (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
		DatDebut, DatFin);
	
set identity_insert [Bud].[Exercice] off;

commit transaction;

GO
