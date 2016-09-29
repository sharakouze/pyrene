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
		select S.CleSociete as Id,
			ltrim(rtrim(S.CodSociete)) as CodObjet,
			ltrim(rtrim(S.LibSociete)) as LibObjet,
			ltrim(rtrim(S.TxtSociete)) as TxtObjet,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);

	SET IDENTITY_INSERT [GenSociete] OFF;

	-- ajout société par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSociete])
	begin
		insert into [GenSociete] (CodObjet, LibObjet, EstActif, DatCreation, DatModif)
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

	declare @w_CleGenSocieteDef int;
	select @w_CleGenSocieteDef=min(Id) from [GenSociete];

	SET IDENTITY_INSERT [GenSecteur] ON;

	merge into [GenSecteur] as target
	using (
		select CleSecteur as Id,
			ltrim(rtrim(CodSecteur)) as CodObjet,
			ltrim(rtrim(LibSecteur)) as LibObjet,
			ltrim(rtrim(TxtSecteur)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSociete,0),@w_CleGenSocieteDef) as CleGenSociete,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSociete, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
	SET IDENTITY_INSERT [GenSecteur] OFF;

	-- ajout secteur par défaut si la table est vide pour des raisons d'intégrité des données
	if not exists (select * from [GenSecteur])
	begin
		insert into [GenSecteur] (CodObjet, LibObjet, EstActif, DatCreation, DatModif, CleGenSociete)
		values ('SEC', 'Secteur par défaut', 1, GETDATE(), GETDATE(), @w_CleGenSocieteDef);
	end;

	COMMIT;
END TRY
BEGIN CATCH
	SET IDENTITY_INSERT [GenSecteur] OFF;
	THROW;
END CATCH;

BEGIN TRY
	BEGIN TRANSACTION;

	declare @w_CleGenSecteurDef int;
	select @w_CleGenSecteurDef=min(Id) from [GenSecteur];

	SET IDENTITY_INSERT [GenService] ON;

	merge into [GenService] as target
	using (
		select CleService as Id,
			ltrim(rtrim(CodService)) as CodObjet,
			ltrim(rtrim(LibService)) as LibObjet,
			ltrim(rtrim(TxtService)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			coalesce(nullif(CleSecteur,0),@w_CleGenSecteurDef) as CleGenSecteur,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			CleGenSecteur, AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail);
	
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
		select ClePersonne as Id,
			ltrim(rtrim(CodPersonne)) as CodObjet,
			ltrim(rtrim(NomPersonne)) as NomPersonne,
			ltrim(rtrim(PrePersonne)) as PrePersonne,
			null as TxtObjet,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCivilite, NumTelep, NumFax, NumEmail)
		values (Id, CodObjet, NomPersonne, PrePersonne, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
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
		select ClePersonne as CleGenPersonne,
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
	on (target.CleGenPersonne=source.CleGenPersonne)
	when not matched by target
	then -- insert new rows
		insert (CleGenPersonne, ImgSignature, TypMime)
		values (CleGenPersonne, ImgSignature, TypMime);

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
		select PRF.ClePersonneProfil as Id,
			PRF.ClePersonne as CleGenPersonne,
			PRF.CodProfil as CodObjet,
			PRF.CleSociete as CleGenSociete,
			PRF.CleSecteur as CleGenSecteur,
			PRF.CleService as CleGenService,
			P.DatCreation,
			coalesce(P.DatModif,P.DatCreation) as DatModif
		from $(SourceSchemaName).[Gen_SocPersonneProfil] PRF inner join $(SourceSchemaName).[Gen_SocPersonne] P on PRF.ClePersonne=P.ClePersonne
		where PRF.ClePersonne>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenPersonne, CodObjet, CleGenSociete, CleGenSecteur, CleGenService, DatCreation, DatModif)
		values (Id, CleGenPersonne, CodObjet, CleGenSociete, CleGenSecteur, CleGenService, DatCreation, DatModif);
	
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
			null as CleGenSociete, 
			coalesce(N.CleSecteur,C.CleSecteur) as CleGenSecteur, 
			coalesce(N.CleService,C.CleService) as CleGenService, 
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleGenSociete, CleGenSecteur, CleGenService, ValFormatNumero)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			TypCompteur, TypPeriodicite, CleGenSociete, CleGenSecteur, CleGenService, ValFormatNumero);
	
	SET IDENTITY_INSERT [GenCompteur] OFF;

	-- mise à jour eventuelle de CleGenSociete
	update CPT
	set CPT.CleGenSociete=SEC.CleGenSociete
	from [GenCompteur] CPT inner join [GenSecteur] SEC on CPT.CleGenSecteur=SEC.Id
	where CPT.CleGenSociete is null and CPT.CleGenSecteur is not null;

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
		select N.CleMNumero as CleGenCompteur,
			V.CodPeriode as ValPeriode,
			V.ValCompteur
		from $(SourceSchemaName).[Gen_Cpt_MNumero] N inner join $(SourceSchemaName).[Gen_CptValeur] V on N.CleCompteur=V.CleCompteur
		where N.CleMNumero>0
	) as source
	on (target.CleGenCompteur=source.CleGenCompteur and target.ValPeriode=source.ValPeriode)
	when not matched by target
	then -- insert new rows
		insert (CleGenCompteur, ValPeriode, ValCompteur)
		values (CleGenCompteur, ValPeriode, ValCompteur);
	
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
		select CleMdtMandataire as Id,
			CleMandat as CleGenMandat,
			CleMandataire as CleGenPersonne,
			CleSociete as CleGenSociete,
			CleSecteur as CleGenSecteur,
			CleService as CleGenService,
			EstSuspendu
		from $(SourceSchemaName).[GenP_MdtMandataire]
		where CleMandat>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenMandat, CleGenPersonne, CleGenSociete, CleGenSecteur, CleGenService, EstSuspendu)
		values (Id, CleGenMandat, CleGenPersonne, CleGenSociete, CleGenSecteur, CleGenService, EstSuspendu);
	
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
		select CleTVA as Id,
			ltrim(rtrim(CodTVA)) as CodObjet,
			ltrim(rtrim(LibTVA)) as LibObjet,
			ltrim(rtrim(TxtTVA)) as TxtObjet,
			EstActif,
			DatCreation,
			coalesce(DatModif,DatCreation) as DatModif,
			CleExterne as CodExterne,
			TauTVA
		from $(SourceSchemaName).[Gen_DivTVA]
		where CleTVA>0
	) as source
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, TauTVA)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne, TauTVA);
	
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
		select CleFourn as Id, 
			ltrim(rtrim(CodFourn)) as CodObjet,
			ltrim(rtrim(LibFourn)) as LibObjet,
			ltrim(rtrim(TxtFourn)) as TxtObjet,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			AdrRue, AdrCode, AdrCommune, AdrPays, NumTelep, NumFax, NumEmail, CodCompta, NumClient, 
			NumTVAIntra, MntFPort, MntFPortGratuit, MntCommandeMin, DelLivraison, DelPaiement, ValNote,
			TypModeReglement, EstEnvoiMailBonCde)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
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
		select FC.CleFourn as CleGenFourn,
			isnull(FC.NomContact_Clean,FC.NomContact) as NomContact,
			null as PreContact,
			null as TxtObjet, 
			coalesce(F.DatSaisie,getdate()) as DatCreation,
			coalesce(F.DatSaisie,getdate()) as DatModif,
			FC.NumTelep, 
			null as NumFax, 
			FC.NumEmail, 
			FC.TypCivilite, 
			null as LibFonction
		from @GenFournContact FC inner join $(SourceSchemaName).[t_Fourn] F on FC.CleFourn=F.CleFourn
	) as source
	on (target.CleGenFourn=source.CleGenFourn and target.NomContact=source.NomContact)
	when not matched by target
	then -- insert new rows
		insert (CleGenFourn, NomContact, PreContact, TxtObjet, DatCreation, DatModif,
			NumTelep, NumFax, NumEmail, TypCivilite, LibFonction)
		values (CleGenFourn, NomContact, PreContact, TxtObjet, DatCreation, DatModif,
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
		select FR.CleRib as Id,
			FR.CleFourn as CleGenFourn,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CleGenFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif)
		values (Id, CleGenFourn, CodIBAN, CodBIC, LibEtablissement, EstDefaut, DatCreation, DatModif);
	
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
		select CleExercice as Id,
			ltrim(rtrim(CodExercice)) as CodObjet,
			ltrim(rtrim(LibExercice)) as LibObjet,
			ltrim(rtrim(TxtExercice)) as TxtObjet,
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
	on (target.Id=source.Id)
	when not matched by target
	then -- insert new rows
		insert (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
			DatDebut, DatFin)
		values (Id, CodObjet, LibObjet, TxtObjet, EstActif, DatCreation, DatModif, CodExterne,
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
