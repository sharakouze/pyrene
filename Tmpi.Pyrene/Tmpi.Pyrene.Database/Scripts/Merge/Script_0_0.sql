/* REMARQUES :
- Profils d'utilisateurs :
A quoi sert le lien sur Gen_SocSite ? Suppression de CleSite.

- Compteurs :
Gen_CptCompteur disparait et est fusionné avec Gen_Cpt_MNumero.
Doublons ?
Le modele de numérotation est fusionné en 1 seul champ

- Mandats :
Suppression de CleLogiciel qu'on retrouve par déduction dans TypMandat.

- Fourn :
Plusieurs contacts possibles.
On passe d'un RIB en IBAN pour les coordonées banquaires
Suppression de CleProprietaire

- Exercice :
NivExercice devient EstActif.
*/

SET XACT_ABORT ON;
SET NOCOUNT ON;

GO

:setvar SourceSchemaName "[LASAT_PYRENE2].[SA_TMPI]"

GO

--
-- FONCTIONS TEMP
--

if (OBJECT_ID('[dbo].[TEMP_BBAN_TO_IBAN]')) is not null
	drop function [dbo].[TEMP_BBAN_TO_IBAN];
GO
create function [dbo].[TEMP_BBAN_TO_IBAN] ( @bban varchar(30), @country char(2) )
returns varchar(40)
as
-- Creates an IBAN (International Bank Account Number) from a BBAN (Basic Bank Account Number) and BIC (Bank Identifier Code)
BEGIN 
	declare @bbanwk varchar(60), @bbannbp int, @bbanp varchar(9), @pos smallint, @mod int, @i smallint, @keyiban char(2), @iban varchar(40)
	-- Place it at the end of BBAN
	set @bbanwk = @bban + @country + '00'
	-- Replace any letters with their numeric value (code ASCII - 55)
	while isnumeric(@bbanwk+'e0') = 0
		BEGIN
			set @pos = (select patindex('%[^0-9]%',@bbanwk))
			set @bbanwk = (select replace(@bbanwk,substring(@bbanwk,@pos,1),ascii(substring(@bbanwk,@pos,1))-55))
		END
	-- Split the BBAN into parts of 9 numbers max (because too long for SQL data type INT) and calculate MOD 97 of each part
	-- suppose to add 1 iteration each 4 iteration, so init @i = 0 and not 1 for some case.
	set @bbannbp = ceiling(len(@bbanwk) / 9.0) 
	set @pos = 10
	set @i = 0
	set @bbanp = left(@bbanwk, 9)
	while @i <= @bbannbp
		BEGIN
			set @mod = cast(@bbanp as int) % 97
			-- Put the result at the beginning of the next group			
			set @bbanp = cast(@mod as varchar) + substring(@bbanwk, @pos, 7)
			set @i = @i + 1
			set @pos = @pos + 7
		END
	-- IBAN key 2 characters
	set @keyiban = right('00' + cast((98 - @mod) as varchar), 2)
	set @iban = @country + @keyiban + @bban
RETURN @iban
END;

GO

if (OBJECT_ID('[dbo].[TEMP_SPLIT]')) is not null
	drop function [dbo].[TEMP_SPLIT];
GO
create function [dbo].[TEMP_SPLIT] ( @text varchar(8000), @separator varchar(20) = ',' )
returns @strings table
(
	rownum int identity primary key,
	column_value varchar(8000)
)
as
	-- retourne une table contenant les sous-chaînes de "@text" qui sont délimitées par "@separator"
	--
BEGIN
	declare @index int
	set @index = -1

	while (len(@text) > 0)
	begin
		set @index = charindex(@separator , @text)
		if (@index = 0) and (len(@text) > 0)
		begin
			insert into @strings values (@text)
			break
		end
		if (@index > 1)
		begin
			insert into @strings values (left(@text, @index - 1))
			set @text = right(@text, (len(@text) - @index))
		end
		else
			set @text = right(@text, (len(@text) - @index))
	end
	return
END;

GO


--
-- SOCIETES, SECTEURS et SERVICES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenSociete] ON;

	merge into [GenSociete] as target
	using (
		select S.CleSociete,
			ltrim(rtrim(S.CodSociete)) as CodSociete,
			ltrim(rtrim(S.LibSociete)) as LibSociete,
			ltrim(rtrim(S.TxtSociete)) as TxtSociete,
			S.EstActif,
			S.DatCreation,
			coalesce(S.DatModif,S.DatCreation) as DatModif,
			S.CleExterne as CodExterne,
			S.AdrRue,
			S.AdrCode,
			S.AdrVille as AdrCommune,
			P.LibPays as AdrPays,
			S.NumTelep,
			S.NumTelec as NumFax,
			S.NumEmail
		from $(SourceSchemaName).[Gen_SocSociete] S left join $(SourceSchemaName).[Gen_Pays] P on S.ClePays=P.ClePays
		where S.CleSociete>0
	) as source
	on (target.CleSociete=source.CleSociete)
	when not matched by target
	then -- insert new rows
		insert (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleSociete, CodSociete, LibSociete, TxtSociete, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);

	SET IDENTITY_INSERT [GenSociete] OFF;

	-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSociete])
	begin
		insert into [GenSociete] (CodSociete, LibSociete, EstActif, DatCreation, DatModif)
		values ('SOC', 'Société par défaut', 1, GETDATE(), GETDATE());
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSociete] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleSocieteDef int;
	select @w_CleSocieteDef=min(CleSociete) from [GenSociete];

	SET IDENTITY_INSERT [GenSecteur] ON;

	merge into [GenSecteur] as target
	using (
		select CleSecteur,
			ltrim(rtrim(CodSecteur)) as CodSecteur,
			ltrim(rtrim(LibSecteur)) as LibSecteur,
			ltrim(rtrim(TxtSecteur)) as TxtSecteur,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSociete,0),@w_CleSocieteDef) as CleSociete,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocSecteur]
		where CleSecteur>0
	) as source
	on (target.CleSecteur=source.CleSecteur)
	when not matched by target
	then -- insert new rows
		insert (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
			CleSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleSecteur, CodSecteur, LibSecteur, TxtSecteur, EstActif, DatCreation, DatModif, CodExterne,
			CleSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenSecteur] OFF;

	-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSecteur])
	begin
		insert into [GenSecteur] (CodSecteur, LibSecteur, EstActif, DatCreation, DatModif, CleSociete)
		values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleSocieteDef);
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSecteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleSecteurDef int;
	select @w_CleSecteurDef=min(CleSecteur) from [GenSecteur];

	SET IDENTITY_INSERT [GenService] ON;

	merge into [GenService] as target
	using (
		select CleService,
			ltrim(rtrim(CodService)) as CodService,
			ltrim(rtrim(LibService)) as LibService,
			ltrim(rtrim(TxtService)) as TxtService,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSecteur,0),@w_CleSecteurDef) as CleSecteur,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocService]
		where CleService>0
	) as source
	on (target.CleService=source.CleService)
	when not matched by target
	then -- insert new rows
		insert (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
			CleSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (CleService, CodService, LibService, TxtService, EstActif, DatCreation, DatModif, CodExterne,
			CleSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenService] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenService] OFF;
	THROW;
END CATCH;

GO

--
-- PERSONNES, SIGNATURES et PROFILS UTILISATEURS
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonne] ON;

	merge into [GenPersonne] as target
	using (
		select ClePersonne,
			ltrim(rtrim(CodPersonne)) as CodPersonne,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtPersonne,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			CleGenre as TypCivilite,
			NumTelep,
			null as NumFax,
			NumEmail
		from $(SourceSchemaName).[Gen_SocPersonne]
		where ClePersonne>0
	) as source
	on (target.ClePersonne=source.ClePersonne)
	when not matched by target
	then -- insert new rows
		insert (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (ClePersonne, CodPersonne, NomPersonne, PrePersonne, TxtPersonne, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenPersonne] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonne] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenPersonneSignature] as target
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
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenPersonneProfil] ON;

	merge into [GenPersonneProfil] as target
	using (
		select PRF.ClePersonneProfil as CleProfil,
			PRF.ClePersonne,
			PRF.CodProfil,
			PRF.CleSociete,
			PRF.CleSecteur,
			PRF.CleService,
			P.DatCreation,
			coalesce(P.DatModif,P.DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne
		where PRF.ClePersonne>0
	) as source
	on (target.CleProfil=source.CleProfil)
	when not matched by target
	then -- insert new rows
		insert (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService, DatCreation, DatModif)
		values (CleProfil, ClePersonne, CodProfil, CleSociete, CleSecteur, CleService, DatCreation, DatModif);
	
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenPersonneProfil] OFF;
	THROW;
END CATCH;

GO

--
-- COMPTEURS, MODELES DE NUMEROTATION et VALEUR DES COMPTEURS
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenCompteur] ON;

	merge into [GenCompteur] as target
	using (
		select N.CleMNumero as CleCompteur, 
			ltrim(rtrim(N.CodMNumero)) as CodCompteur, 
			ltrim(rtrim(N.LibMNumero)) as LibCompteur, 
			ltrim(rtrim(N.TxtMNumero)) as TxtCompteur, 
			N.EstActif, 
			N.DatCreation,
			coalesce(N.DatModif,N.DatCreation) as DatModif,
			N.CleExterne as CodExterne,
			N.TypCompteur, 
			C.TypPeriodicite, 
			null as CleSociete, 
			coalesce(N.CleSecteur,C.CleSecteur) as CleSecteur, 
			coalesce(N.CleService,C.CleService) as CleService, 
			isnull(N.ValPrefixe1,'')
				+isnull('{date:'+N.ValDate1+'}','')
				+isnull(N.ValPrefixe2,'')
				+'{num:'+replicate('0',N.NbrCaractere)+'}'
				+isnull(N.ValSuffixe1,'')
				+isnull('{date:'+N.ValDate2+'}','')
				+isnull(N.ValSuffixe2,'') as ValFormatNumero
		from $(SourceSchemaName).[Gen_CptCompteur] C inner join $(SourceSchemaName).[Gen_Cpt_MNumero] N on C.CleCompteur=N.CleCompteur
		where C.CleCompteur>0 and N.CleMNumero>0
	) as source
	on (target.CleCompteur=source.CleCompteur)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleSociete, CleSecteur, CleService, ValFormatNumero)
		values (CleCompteur, CodCompteur, LibCompteur, TxtCompteur, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleSociete, CleSecteur, CleService, ValFormatNumero);
	
	SET IDENTITY_INSERT [GenCompteur] OFF;

	-- mise à jour eventuelle de CleSociete
	update CPT
	set CPT.CleSociete=SEC.CleSociete
	from [GenCompteur] CPT inner join [GenSecteur] SEC on CPT.CleSecteur=SEC.CleSecteur
	where CPT.CleSociete is null and CPT.CleSecteur is not null;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenCompteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	merge into [GenCompteurValeur] as target
	using (
		select N.CleMNumero as CleCompteur,
			V.CodPeriode as ValPeriode,
			V.ValCompteur
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N inner join $(SourceSchemaName).[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
		where N.CleMNumero>0
	) as source
	on (target.CleCompteur=source.CleCompteur and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CleCompteur, ValPeriode, ValCompteur)
		values (CleCompteur, ValPeriode, ValCompteur);
	
	COMMIT;
END TRY
BEGIN CATCH
	THROW;
END CATCH;

GO

--
-- MANDATS et MANDATAIRES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandat] ON;

	merge into [GenMandat] as target
	using (
		select CleMandat,
			ltrim(rtrim(CodMandat)) as CodMandat,
			ltrim(rtrim(LibMandat)) as LibMandat,
			ltrim(rtrim(TxtMandat)) as TxtMandat,
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
	on (target.CleMandat=source.CleMandat)
	when not matched by target
	then -- insert new rows
		insert (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage)
		values (CleMandat, CodMandat, LibMandat, TxtMandat, EstActif, DatCreation, DatModif, CodExterne,
			TypMandat, NivMandat, NbrSignature, TxtMessage);
	
	SET IDENTITY_INSERT [GenMandat] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandat] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenMandatMandataire] ON;

	merge into [GenMandatMandataire] as target
	using (
		select CleMdtMandataire as CleMandataire,
			CleMandat,
			CleMandataire as ClePersonne,
			CleSociete,
			CleSecteur,
			CleService,
			EstSuspendu
		from $(SourceSchemaName).[GenP_MdtMandataire]
		where CleMandat>0
	) as source
	on (target.CleMandataire=source.CleMandataire)
	when not matched by target
	then -- insert new rows
		insert (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu)
		values (CleMandataire, CleMandat, ClePersonne, CleSociete, CleSecteur, CleService, EstSuspendu);
	
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenMandatMandataire] OFF;
	THROW;
END CATCH;

GO

--
-- TVA
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenTVA] ON;

	merge into [GenTVA] as target
	using (
		select CleTVA,
			ltrim(rtrim(CodTVA)) as CodTVA,
			ltrim(rtrim(LibTVA)) as LibTVA,
			ltrim(rtrim(TxtTVA)) as TxtTVA,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.CleTVA=source.CleTVA)
	when not matched by target
	then -- insert new rows
		insert (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA)
		values (CleTVA, CodTVA, LibTVA, TxtTVA, EstActif, DatCreation, DatModif, CodExterne, TauTVA);
	
	SET IDENTITY_INSERT [GenTVA] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenTVA] OFF;
	THROW;
END CATCH;

GO

--
-- FOURNISSEURS, CONTACTS et COORDONNEES BANQUAIRES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenFourn] ON;

	merge into [GenFourn] as target
	using (
		select CleFourn, 
			ltrim(rtrim(CodFourn)) as CodFourn,
			ltrim(rtrim(LibFourn)) as LibFourn,
			ltrim(rtrim(TxtFourn)) as TxtFourn,
			1 as EstActif,
			coalesce(DatSaisie,getdate()) as DatCreation,
			coalesce(DatSaisie,getdate()) as DatModif,
			null as CodExterne,
			AdrRue,
			AdrCode,
			AdrVille as AdrCommune,
			null as AdrPays,
			NumTelep,
			NumTelec as NumFax,
			NumEmail,
			CodCompta,
			NumClient,
			NumTVAIntra,
			MntFPort,
			ValSPort as MntFPortGratuit,
			MntCommandeMin,
			DelLivraison,
			nullif(ValDelaiP,0) as DelPaiement,
			ValNote,
			nullif(CleModeReglement,0) as TypModeReglement,
			EstEnvoiMailBonCde
		from $(SourceSchemaName).[t_Fourn]
		where CleFourn>0
	) as source
	on (target.CleFourn=source.CleFourn)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde)
		values (CleFourn, CodFourn, LibFourn, TxtFourn, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde);
	
	SET IDENTITY_INSERT [GenFourn] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFourn] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @GenFournContact table (
		CleFourn int not null,
		NomContact varchar(100) not null,
		NomContact_Clean varchar(100) null,
		TypCivilite int null,
		NumEmail varchar(100) null,
		NumTelep varchar(25) null
	);
	
	insert into @GenFournContact ( CleFourn, NomContact )
	select CleFourn,
		ltrim(rtrim(NomContact)) as NomContact
	from $(SourceSchemaName).[t_Fourn]
	where CleFourn>0
		and NomContact is not null and NomContact<>'' and NomContact<>'INACTIF';

	declare TEMP_CURSOR cursor fast_forward for
	select CleFourn, NomContact
	from @GenFournContact;

	declare @CleFourn int;
	declare @NomContact varchar(100);

	declare @strings table ( id int, txt varchar(100) );
	
	open TEMP_CURSOR;
 
    fetch next from TEMP_CURSOR into @CleFourn, @NomContact;
    while @@FETCH_STATUS=0
	begin
		delete @strings;
		insert into @strings
		select * from [dbo].[TEMP_SPLIT](@NomContact, ' ');

		-- extraction civilité
		declare @TypCivilite int = null;
		select top 1 @TypCivilite=case
			when txt='Monsieur' then 1
			when txt='M' then 1
			when txt='Mr' then 1
			when txt='M.' then 1
			when txt='Mr.' then 1
			when txt='Madame' then 2
			when txt='Mme' then 2
			when txt='Mme.' then 2
			when txt='Mademoiselle' then 3
			when txt='Melle' then 3
			when txt='Melle.' then 3
			else null end
		from @strings;
		if (@TypCivilite is not null)
		begin
			update @GenFournContact set TypCivilite=@TypCivilite
			where CleFourn=@CleFourn;

			delete @strings where id=1;
		end;

		declare @id int;

		-- extraction email
		set @id = null;
		select @id=id from @strings where txt like '%@%' and txt like '%.%';
		if (@id is not null)
		begin
			update @GenFournContact set NumEmail=(select txt from @strings where id=@id)
			where CleFourn=@CleFourn;
			update @GenFournContact set NumEmail=right(NumEmail,len(NumEmail)-1)
			where CleFourn=@CleFourn and left(NumEmail,1) not like '[a-zA-Z]';
			update @GenFournContact set NumEmail=left(NumEmail,len(NumEmail)-1)
			where CleFourn=@CleFourn and right(NumEmail,1) not like '[a-zA-Z]';

			delete @strings where id=@id;
		end;

		-- extraction téléphone
		set @id = null;
		select @id=id from @strings where len(txt)>=10 and isnumeric(replace(txt,'.',''))=1;
		if (@id is not null)
		begin
			update @GenFournContact set NumTelep=(select txt from @strings where id=@id)
			where CleFourn=@CleFourn;

			delete @strings where id=@id;
		end;

		if ((select count(*) from @strings)>0)
		begin
			update @GenFournContact set NomContact_Clean=stuff((select ' '+txt from @strings for xml path('')),1,1,'')
			where CleFourn=@CleFourn;
		end;

		fetch next from TEMP_CURSOR into @CleFourn, @NomContact;
    end;
 
    close TEMP_CURSOR;
    deallocate TEMP_CURSOR;

	merge into [GenFournContact] as target
	using (
		select FC.CleFourn,
			isnull(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtContact, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif,
			FC.NumTelep, 
			null as NumFax, 
			FC.NumEmail, 
			FC.TypCivilite, 
			null as LibFonction
		from @GenFournContact FC inner join $(SourceSchemaName).[t_Fourn] F on FC.CleFourn=F.CleFourn
	) as source
	on (target.CleFourn=source.CleFourn and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleFourn, NomContact, PreContact, TxtContact, DatCreation, DatModif,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (CleFourn, NomContact, PreContact, TxtContact, DatCreation, DatModif,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction);

	COMMIT;
END TRY
BEGIN CATCH
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @CodePaysIBAN char(2) = 'FR';

	SET IDENTITY_INSERT [GenFournBanque] ON;

	merge into [GenFournBanque] as target
	using (
		select FR.CleRib as CleBanque,
			FR.CleFourn as CleFourn,
			[dbo].[TEMP_BBAN_TO_IBAN](FR.RibBanque+FR.RibGuichet+FR.RibCompte+FR.RibCle, @CodePaysIBAN) as CodIBAN,
			@CodePaysIBAN as CodBIC,
			FR.LibBanque as LibEtablissement,
			FR.EstDefaut,
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif
		from $(SourceSchemaName).[Gen_FouRib] FR inner join $(SourceSchemaName).[t_Fourn] F on FR.CleFourn=F.CleFourn
		where FR.CleFourn>0
			and FR.RibBanque is not null 
			and FR.RibGuichet is not null 
			and FR.RibCompte is not null 
			and FR.RibCle is not null 
	) as source
	on (target.CleBanque=source.CleBanque)
	when not matched by target
	then -- insert new rows
		insert (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif)
		values (CleBanque, CleFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif);
	
	SET IDENTITY_INSERT [GenFournBanque] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenFournBanque] OFF;
	THROW;
END CATCH;

GO

--
-- EXERCICES
--

BEGIN TRY
	BEGIN TRANSACTION;

	SET IDENTITY_INSERT [GenExercice] ON;

	merge into [GenExercice] as target
	using (
		select CleExercice,
			ltrim(rtrim(CodExercice)) as CodExercice,
			ltrim(rtrim(LibExercice)) as LibExercice,
			ltrim(rtrim(TxtExercice)) as TxtExercice,
			case NivExercice
				when 9 then 1 -- Actif
				when 1 then 0 -- Inactif
				when 99 then 0 -- Cloturé
				else 0
			end as EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			DatDebut,
			DatFin
		from $(SourceSchemaName).[Gen_DivExercice]
		where CleExercice>0
	) as source
	on (target.CleExercice=source.CleExercice)
	when not matched by target
	then -- insert new rows
		insert (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin)
		values (CleExercice, CodExercice, LibExercice, TxtExercice, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin);
	
	SET IDENTITY_INSERT [GenExercice] OFF;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenExercice] OFF;
	THROW;
END CATCH;

GO



-- NETTOYAGE

DROP FUNCTION [dbo].[TEMP_BBAN_TO_IBAN];
DROP FUNCTION [dbo].[TEMP_SPLIT];
