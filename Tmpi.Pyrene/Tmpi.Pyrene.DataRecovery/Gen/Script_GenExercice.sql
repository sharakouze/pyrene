/*
SOURCES :
- [Gen_DivExercice]

REMARQUES :
- Exercice :
NivExercice devient EstActif.
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Exercice] ON;

	merge into [Gen].[Exercice] as target
	using (
		select CleExercice as Id,
			ltrim(rtrim(CodExercice)) as CodObjet,
			ltrim(rtrim(LibExercice)) as LibObjet,
			ltrim(rtrim(TxtExercice)) as TxtObjet,
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
	
	SET IDENTITY_INSERT [Gen].[Exercice] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Exercice] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
