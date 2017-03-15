/*
SOURCES :
- [Gen_CptCompteur]
- [Gen_Cpt_MNumero]
- [Gen_CptValeur]

REMARQUES :
- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.
Le modele de numérotation est fusionné en 1 seul champ (ValFormatNumero).
Ajout de EstDefaut pour choisir le bon compteur dans le cas d'un TypCompteur en doublon.
*/

DECLARE @ErMessage VARCHAR(MAX);
DECLARE @ErSeverity INT;
DECLARE @ErState INT;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [Gen].[Compteur] ON;

	merge into [Gen].[Compteur] as target
	using (
		select N.CleMNumero as Id, 
			ltrim(rtrim(N.CodMNumero)) as CodObjet, 
			ltrim(rtrim(N.LibMNumero)) as LibObjet, 
			ltrim(rtrim(N.TxtMNumero)) as TxtObjet, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			C.TypPeriodicite, 
			[dbo].[TMP_SOC_TO_SERVICE](null, N.CleSecteur, N.CleService) as ServiceId,
			0 as EstDefaut,
			coalesce(N.ValPrefixe1,'')
				+coalesce('{date:'+N.ValDate1+'}','')
				+coalesce(N.ValPrefixe2,'')
				+'{num:'+replicate('0',N.NbrCaractere)+'}'
				+coalesce(N.ValSuffixe1,'')
				+coalesce('{date:'+N.ValDate2+'}','')
				+coalesce(N.ValSuffixe2,'') as ValFormatNumero
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N 
		inner join $(SourceSchemaName).[Gen_CptCompteur] C on N.CleCompteur=C.CleCompteur and C.CleCompteur>0
		where N.CleMNumero>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, ServiceId, EstDefaut, ValFormatNumero)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, ServiceId, EstDefaut, ValFormatNumero);
	
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;

	-- Maj du compteur par défaut par groupe TypCompteur/ServiceId
	update [Gen].[Compteur]
	set EstDefaut=1
	where Id in (
		select min(Id) as Id
		from [Gen].[Compteur]
		group by TypCompteur, ServiceId
	);

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[CompteurValeur] as target
	using (
		select N.CleMNumero as CompteurId,
			V.CodPeriode as ValPeriode,
			V.ValCompteur,
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_CptValeur] V
		inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on V.CleCompteur=N.CleCompteur
		where V.CleCompteur>0
			and N.CleMNumero>0
	) as source
	on (target.CompteurId=source.CompteurId and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CompteurId, ValPeriode, ValCompteur, DatCreation, DatModif)
		values (CompteurId, ValPeriode, ValCompteur, DatCreation, DatModif);
	
	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	RETURN;
END CATCH;

GO
