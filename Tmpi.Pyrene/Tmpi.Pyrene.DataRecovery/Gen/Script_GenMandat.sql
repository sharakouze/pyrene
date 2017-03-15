/* 
SOURCES :
- [GenP_MdtMandat]
- [GenP_MdtMandataire]

REMARQUES :
- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Mandat] ON;

	merge into [Gen].[Mandat] as target
	using (
		select CleMandat as Id,
			ltrim(rtrim(CodMandat)) as CodObjet,
			ltrim(rtrim(LibMandat)) as LibObjet,
			ltrim(rtrim(TxtMandat)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			null as CodExterne,
			TypMandat,
			NivMandat,
			NbrSignature,
			TxtMessage
		from $(SourceSchemaName).[GenP_MdtMandat]
		where CleMandat>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Mandat] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[MandatMandataire] ON;

	merge into [Gen].[MandatMandataire] as target
	using (
		select MM.CleMdtMandataire as Id,
			MM.CleMandat as MandatId,
			MM.CleMandataire as PersonneId,
			[dbo].[TMP_SOC_TO_SERVICE](MM.CleSociete, MM.CleSecteur, MM.CleService) as ServiceId,
			MM.EstSuspendu,
			M.DatCreation,
			coalesce(M.DatModif,M.DatCreation) as DatModif
		from $(SourceSchemaName).[GenP_MdtMandataire] MM
		inner join $(SourceSchemaName).[GenP_MdtMandat] M on MM.CleMandat=M.CleMandat and MM.CleMandat>0
		where MM.CleMdtMandataire>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, MandatId, PersonneId, ServiceId, EstSuspendu,
			DatCreation, DatModif)
		values (Id, MandatId, PersonneId, ServiceId, EstSuspendu,
			DatCreation, DatModif);
	
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[MandatMandataire] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
