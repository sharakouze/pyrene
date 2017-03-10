--
-- PROPRIETES DES TIERS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[ProprieteTiers] ON;

	merge into [Gen].[ProprieteTiers] as target
	using (
		select ClePropriete as CleProprieteTiers,
			ltrim(rtrim(CodPropriete)) as CodProprieteTiers,
			ltrim(rtrim(LibPropriete)) as LibProprieteTiers,
			ltrim(rtrim(TxtPropriete)) as TxtProprieteTiers,
			1 as EstActif,
			getdate() as DatCreation,
			null as DatModif,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_Trs_Propriete]
		where ClePropriete>0
	) as source
	on (target.CleProprieteTiers=source.CleProprieteTiers)
	when not matched by target
	then -- insert new rows
		insert (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, DatModif, CodExterne)
		values (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, DatModif, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[ProprieteTiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[ProprieteTiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
