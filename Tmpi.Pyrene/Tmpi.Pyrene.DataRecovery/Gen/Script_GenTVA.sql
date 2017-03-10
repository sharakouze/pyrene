--
-- TVA
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[TVA] ON;

	merge into [Gen].[TVA] as target
	using (
		select CleTVA,
			ltrim(rtrim(CodTVA)) as CodTVA,
			ltrim(rtrim(LibTVA)) as LibTVA,
			ltrim(rtrim(TxtTVA)) as TxtTVA,
			EstActif,
			DatCreation,
			DatModif,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.CleTVA=source.CleTVA)
	when not matched by target
	then -- insert new rows
		insert (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, 
			DatCreation, DatModif, CodExterne, TauTVA)
		values (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, 
			DatCreation, DatModif, CodExterne, TauTVA);
	
	SET IDENTITY_INSERT [Gen].[TVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[TVA] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
