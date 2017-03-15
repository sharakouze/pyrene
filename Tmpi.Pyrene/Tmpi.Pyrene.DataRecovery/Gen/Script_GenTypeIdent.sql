/*
SOURCES :
- [Gen_TrsTypIdent]
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TypeIdent] ON;

	merge into [Gen].[TypeIdent] as target
	using (
		select CleTypIdent as Id,
			ltrim(rtrim(CodTypIdent)) as CodObjet,
			ltrim(rtrim(LibTypIdent)) as LibObjet,
			ltrim(rtrim(TxtTypIdent)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_TrsTypIdent]
		where CleTypIdent>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
