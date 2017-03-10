--
-- TIERS
--

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Tiers] ON;

	merge into [Gen].[Tiers] as target
	using (
		select T1.CleTiers,
			ltrim(rtrim(T1.NumTiers)) as NumTiers,
			ltrim(rtrim(T1.NomTiers)) as NomTiers,
			ltrim(rtrim(T1.TxtTiers)) as TxtTiers,
			coalesce(T1.EstActif,1) as EstActif,
			coalesce(T1.DatCreation,getdate()) as DatCreation,
			coalesce(T1.CleCreateur,0) as CleCreateur,
			T1.DatModif as DatEdition,
			T1.CleOperateur as CleEditeur,
			T1.CleExterne as CodExterne,
			T1.AdrRue,
			T1.AdrCode,
			T1.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			T1.NumTelep,
			T1.NumTelec as NumFax,
			T1.NumEmail,
			T1.AdrLatitude,
			T1.AdrLongitude,
			T1.AdrVilleSuite as AdrCommuneSuite,
			T1.CodCompta,
			--
			T2.CleTiers as CleTiersPrincipal,
			C.CleCivilite as CleCiviliteTiers,
			P1.ClePropriete as CleProprieteTiers1,
			P2.ClePropriete as CleProprieteTiers2,
			P3.ClePropriete as CleProprieteTiers3
		from $(SourceSchemaName).[Gen_TrsTiers] T1
		left join $(SourceSchemaName).[Gen_Pays] P on T1.ClePays=P.ClePays and P.ClePays>0
		left join $(SourceSchemaName).[Gen_TrsTiers] T2 on T1.ClePointP=T2.CleTiers and T2.CleTiers>0
		left join $(SourceSchemaName).[Gen_Trs_Civilite] C on T1.CleCivilite=C.CleCivilite and C.CleCivilite>0
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P1 on T1.ClePropriete1=P1.ClePropriete and P1.ClePropriete>0
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P2 on T1.ClePropriete2=P2.ClePropriete and P2.ClePropriete>0
		left join $(SourceSchemaName).[Gen_Trs_Propriete] P3 on T1.ClePropriete3=P3.ClePropriete and P3.ClePropriete>0
		where T1.CleTiers>0
	) as source
	on (target.CleProprieteTiers=source.CleProprieteTiers)
	when not matched by target
	then -- insert new rows
		insert (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne)
		values (CleProprieteTiers, CodProprieteTiers, LibProprieteTiers, TxtProprieteTiers, EstActif, 
			DatCreation, CleCreateur, DatEdition, CleEditeur, CodExterne);
	
	SET IDENTITY_INSERT [Gen].[Tiers] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Tiers] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO



tiersident
numident is not null

nomcontact


