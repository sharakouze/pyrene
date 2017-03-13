/*
SOURCES :
- Gen_CptCompteur
- Gen_Cpt_MNumero
- Gen_CptValeur

REMARQUES :
- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.
Doublons ?
Le modele de numérotation est fusionné en 1 seul champ (ValFormatNumero).
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
			[dbo].[TMP_SOC_TO_SERVICE](null, coalesce(N.CleSecteur,C.CleSecteur), coalesce(N.CleService,C.CleService)) as CleService,
			coalesce(N.ValPrefixe1,'')
				+coalesce('{date:'+N.ValDate1+'}','')
				+coalesce(N.ValPrefixe2,'')
				+'{num:'+replicate('0',N.NbrCaractere)+'}'
				+coalesce(N.ValSuffixe1,'')
				+coalesce('{date:'+N.ValDate2+'}','')
				+coalesce(N.ValSuffixe2,'') as ValFormatNumero
		from $(SourceSchemaName).[Gen_CptCompteur] C
		inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0
			and N.CleMNumero>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleService, ValFormatNumero);
	
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [Gen].[Compteur] OFF;
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [Gen].[CompteurValeur] as target
	using (
		select N.CleMNumero as CompteurId,
			V.CodPeriode as ValPeriode,
			V.ValCompteur
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N
		inner join $(SourceSchemaName).[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
		where N.CleMNumero>0
	) as source
	on (target.CompteurId=source.CompteurId and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CompteurId, ValPeriode, ValCompteur)
		values (CompteurId, ValPeriode, ValCompteur);
	
	COMMIT;
END TRY
BEGIN CATCH
	-- THROW
	SELECT @ErMessage=ERROR_MESSAGE(), @ErSeverity=ERROR_SEVERITY(), @ErState=ERROR_STATE();
	RAISERROR(@ErMessage, @ErSeverity, @ErState);
	SET NOEXEC ON;
END CATCH;

GO
