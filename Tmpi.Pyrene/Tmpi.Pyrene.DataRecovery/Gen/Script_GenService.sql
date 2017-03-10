/* REMARQUES :
- Sociétes et Secteurs :
Fusion avec Services, qui permet une arborescence récursive.
*/
--
-- SOCIETES, SECTEURS et SERVICES
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Service] ON;

	merge into [Gen].[Service] as target
	using (
		select [dbo].[TMP_SOC_TO_SERVICE](S.CleSociete, null, null) as CleService,
			'SOC-'+ltrim(rtrim(S.CodSociete)) as CodService,
			ltrim(rtrim(S.LibSociete)) as LibService,
			ltrim(rtrim(S.TxtSociete)) as TxtService,
			S.EstActif,
			S.DatCreation,
			S.DatModif,
			S.CleExterne as CodExterne,
			null as CleServiceParent,
			S.AdrRue,
			S.AdrCode,
			S.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			S.NumTelep,
			S.NumTelec as NumFax,
			S.NumEmail
		from $(SourceSchemaName).[Gen_SocSociete] S
		left join $(SourceSchemaName).[Gen_Pays] P on S.ClePays=P.ClePays and P.ClePays>0
		where S.CleSociete>0
		union all
		select [dbo].[TMP_SOC_TO_SERVICE](null, SEC.CleSecteur, null) as CleService,
			'SEC-'+ltrim(rtrim(SEC.CodSecteur)) as CodService,
			ltrim(rtrim(SEC.LibSecteur)) as LibService,
			ltrim(rtrim(SEC.TxtSecteur)) as TxtService,
			SEC.EstActif,
			SEC.DatCreation,
			SEC.DatModif,
			SEC.CleExterne as CodExterne,
			[dbo].[TMP_SOC_TO_SERVICE](SOC.CleSociete, null, null) as CleServiceParent,
			SEC.AdrRue,
			SEC.AdrCode,
			SEC.AdrVille as AdrCommune,
			null as AdrPays,
			SEC.NumTelep,
			SEC.NumTelec as NumFax,
			SEC.NumEmail
		from $(SourceSchemaName).[Gen_SocSecteur] SEC
		left join $(SourceSchemaName).[Gen_SocSociete] SOC on SEC.CleSociete=SOC.CleSociete and SOC.CleSociete>0
		where SEC.CleSecteur>0
		union all
		select [dbo].[TMP_SOC_TO_SERVICE](null, null, SVC.CleService) as CleService,
			'SVC-'+ltrim(rtrim(SVC.CodService)) as CodService,
			ltrim(rtrim(SVC.LibService)) as LibService,
			ltrim(rtrim(SVC.TxtService)) as TxtService,
			SVC.EstActif,
			SVC.DatCreation,
			SVC.DatModif,
			SVC.CleExterne as CodExterne,
			[dbo].[TMP_SOC_TO_SERVICE](null, SEC.CleSecteur, null) as CleServiceParent,
			SVC.AdrRue,
			SVC.AdrCode,
			SVC.AdrVille as AdrCommune,
			null as AdrPays,
			SVC.NumTelep,
			SVC.NumTelec as NumFax,
			SVC.NumEmail
		from $(SourceSchemaName).[Gen_SocService] SVC
		left join $(SourceSchemaName).[Gen_SocSecteur] SEC on SVC.CleSecteur=SEC.CleSecteur and SEC.CleSecteur>0
		where SVC.CleService>0
	) as source
	on (target.CleService=source.CleService)
	when not matched by target
	then -- insert new rows
		insert (CleService, CodService, LibService, TxtService, EstActif,
			DatCreation, DatModif, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleService, CodService, LibService, TxtService, EstActif, 
			DatCreation, DatModif, CodExterne,
			CleServiceParent, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [Gen].[Service] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Service] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
