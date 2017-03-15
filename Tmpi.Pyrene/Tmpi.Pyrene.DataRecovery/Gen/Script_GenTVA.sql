/*
SOURCES :
- [Gen_DivTVA]
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TVA] ON;

	merge into [Gen].[TVA] as target
	using (
		select CleTVA as Id,
			ltrim(rtrim(CodTVA)) as CodObjet,
			ltrim(rtrim(LibTVA)) as LibObjet,
			ltrim(rtrim(TxtTVA)) as TxtObjet,
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
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, 
			TauTVA)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, 
			TauTVA);
	
	SET IDENTITY_INSERT [Gen].[TVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TVA] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
