--
-- TYPE D'IDENTIFIANT
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TypeIdent] ON;

	merge into [Gen].[TypeIdent] as target
	using (
		select CleTypIdent as CleTypeIdent,
			ltrim(rtrim(CodTypIdent)) as CodTypeIdent,
			ltrim(rtrim(LibTypIdent)) as LibTypeIdent,
			ltrim(rtrim(TxtTypIdent)) as TxtTypeIdent,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_TrsTypIdent]
		where CleTypIdent>0
	) as source
	on (target.CleTypeIdent=source.CleTypeIdent)
	when not matched by target
	then -- insert new rows
		insert (CleTypeIdent, CodTypeIdent, LibTypeIdent, TxtTypeIdent, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne)
		values (CleTypeIdent, CodTypeIdent, LibTypeIdent, TxtTypeIdent, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TypeIdent] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
