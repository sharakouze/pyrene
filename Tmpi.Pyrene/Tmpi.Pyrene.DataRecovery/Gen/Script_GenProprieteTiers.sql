/*
SOURCES :
- [Gen_Trs_Propriete]
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[ProprieteTiers] ON;

	merge into [Gen].[ProprieteTiers] as target
	using (
		select ClePropriete as Id,
			ltrim(rtrim(CodPropriete)) as CodObjet,
			ltrim(rtrim(LibPropriete)) as LibObjet,
			ltrim(rtrim(TxtPropriete)) as TxtObjet,
			1 as EstActif,
			getdate() as DatCreation,
			getdate() as DatModif,
			CleExterne as CodExterne
		from $(SourceSchemaName).[Gen_Trs_Propriete]
		where ClePropriete>0
	) as source
	on (target.CleProprieteTiers=source.CleProprieteTiers)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne);
	
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
