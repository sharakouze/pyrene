/* REMARQUES :
- Profils d'utilisateurs :
Suppression de CleSite. A quoi sert Gen_SocSite ?
*/
--
-- PERSONNES, SIGNATURES et PROFILS UTILISATEURS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Personne] ON;

	merge into [Gen].[Personne] as target
	using (
		select ClePersonne,
			ltrim(rtrim(CodPersonne)) as CodPersonne,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtPersonne,
			EstActif,
			DatCreation,
			DatModif,
			CleExterne as CodExterne,
			nullif(CleGenre,0) as TypCivilite,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif,
			DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, 
			DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [Gen].[Personne] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Personne] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[PersonneSignature] as target
	using (
		select ClePersonne,
			ImgPersonne as ImgSignature,
			case lower(ImgFormat)
				when null then 'image/jpeg'
				when '' then 'image/jpeg'
				when 'jpg' then 'image/jpeg'
				else 'image/'+lower(ImgFormat)
			end as TypMime
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
			and ImgPersonne is not null
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, ImgSignature, TypMime)
		values (ClePersonne, ImgSignature, TypMime);

	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[PersonneProfil] ON;

	merge into [Gen].[PersonneProfil] as target
	using (
		select PRF.ClePersonneProfil as CleProfil,
			PRF.ClePersonne,
			PRF.CodProfil,
			[dbo].[TMP_SOC_TO_SERVICE](PRF.CleSociete, PRF.CleSecteur, PRF.CleService) as CleService,
			P.DatCreation,
			P.DatModif
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF
		inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne and P.ClePersonne>0
		where PRF.ClePersonne>0
	) as source
	on (target.CleProfil=source.CleProfil)
	when not matched by target
	then -- insert new rows
		insert (CleProfil, ClePersonne, CodProfil, CleService, 
			DatCreation, DatModif)
		values (CleProfil, ClePersonne, CodProfil, CleService, 
			DatCreation, DatModif);
	
	SET IDENTITY_INSERT [Gen].[PersonneProfil] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[PersonneProfil] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
