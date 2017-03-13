--
-- CIVILITE DES TIERS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[CiviliteTiers] ON;

	merge into [Gen].[CiviliteTiers] as target
	using (
		select CleCivilite as Id,
			ltrim(rtrim(CodCivilite)) as CodCiviliteTiers,
			ltrim(rtrim(LibCivilite)) as LibCiviliteTiers,
			ltrim(rtrim(TxtCivilite)) as TxtCiviliteTiers,
			coalesce(EstActif,1) as EstActif,
			coalesce(DatModif,getdate()) as DatCreation,
			DatModif,
			null as CodExterne
		from $(SourceSchemaName).[Gen_Trs_Civilite]
		where CleCivilite>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodCiviliteTiers, LibCiviliteTiers, TxtCiviliteTiers, EstActif, 
			DatCreation, DatModif, CodExterne)
		values (Id, CodCiviliteTiers, LibCiviliteTiers, TxtCiviliteTiers, EstActif, 
			DatCreation, DatModif, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[CiviliteTiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[CiviliteTiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
