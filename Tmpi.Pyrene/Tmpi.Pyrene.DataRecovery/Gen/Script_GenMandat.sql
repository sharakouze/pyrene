/* REMARQUES :
- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.
*/
--
-- MANDATS et MANDATAIRES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Mandat] ON;

	merge into [Gen].[Mandat] as target
	using (
		select CleMandat,
			ltrim(rtrim(CodMandat)) as CodMandat,
			ltrim(rtrim(LibMandat)) as LibMandat,
			ltrim(rtrim(TxtMandat)) as TxtMandat,
			EstActif,
			DatCreation,
			CleCreateur,
			DatModif as DatEdition,
			CleOperateur as CleEditeur,
			null as CodExterne,
			TypMandat,
			NivMandat,
			NbrSignature,
			TxtMessage
		from $(SourceSchemaName).[GenP_MdtMandat]
		where CleMandat>0
	) as source
	on (target.CleMandat=source.CleMandat)
	when not matched by target
	then -- insert new rows
		insert (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif,
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[MandatMandataire] ON;

	merge into [Gen].[MandatMandataire] as target
	using (
		select MM.CleMdtMandataire as CleMandataire,
			MM.CleMandat,
			MM.CleMandataire as ClePersonne,
			[dbo].[TMP_SOC_TO_SERVICE](MM.CleSociete, MM.CleSecteur, MM.CleService) as CleService,
			MM.EstSuspendu,
			M.DatCreation,
			M.CleCreateur,
			M.DatModif as DatEdition,
			M.CleOperateur as CleEditeur
		from $(SourceSchemaName).[GenP_MdtMandataire] MM
		inner join $(SourceSchemaName).[GenP_MdtMandat] M on MM.CleMandat=M.CleMandat 
		where MM.CleMandat>0
	) as source
	on (target.CleMandataire=source.CleMandataire)
	when not matched by target
	then -- insert new rows
		insert (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu,
			DatCreation, CleCreateur, DatEdition, CleEditeur)
		values (CleMandataire, CleMandat, ClePersonne, CleService, EstSuspendu,
			DatCreation, CleCreateur, DatEdition, CleEditeur);
	
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
