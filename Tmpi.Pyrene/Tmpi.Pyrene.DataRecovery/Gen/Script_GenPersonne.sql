/*
SOURCES :
- [Gen_SocPersonne]
- [Gen_SocPersonneProfil]

REMARQUES :
- Profils d'utilisateurs :
Suppression de CleSite. A quoi sert Gen_SocSite ?
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Personne] ON;

	merge into [Gen].[Personne] as target
	using (
		select ClePersonne as Id,
			ltrim(rtrim(CodPersonne)) as CodObjet,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			nullif(CleGenre,0) as TypCivilite,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
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
		select ClePersonne as PersonneId,
			ImgPersonne as ImgSignature,
			case lower(ImgFormat)
				when null then 'image/jpeg'
				when '' then 'image/jpeg'
				when 'jpg' then 'image/jpeg'
				else 'image/'+lower(ImgFormat)
			end as TypMime,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
			and ImgPersonne is not null
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (PersonneId, ImgSignature, TypMime, DatCreation, DatModif)
		values (PersonneId, ImgSignature, TypMime, DatCreation, DatModif);

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
		select PRF.ClePersonneProfil as Id,
			PRF.ClePersonne as PersonneId,
			PRF.CodProfil,
			[dbo].[TMP_SOC_TO_SERVICE](PRF.CleSociete, PRF.CleSecteur, PRF.CleService) as ServiceId,
			P.DatCreation,
			coalesce(P.DatModif,P.DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF
		inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne
		where PRF.ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, PersonneId, CodProfil, ServiceId, 
			DatCreation, DatModif)
		values (Id, PersonneId, CodProfil, ServiceId, 
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
