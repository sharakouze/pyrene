/* REMARQUES :
- Exercice :
NivExercice devient EstActif.
*/
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
