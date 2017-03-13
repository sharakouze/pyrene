--
-- START
--

--
-- CONSTANTES POUR LA REPRISE
--

:setvar SourceSchemaName "[CG66_PYRENE_DLB].[SA_TMPI]"

:setvar CleSecteurBase "1000"
:setvar CleServiceBase "20000"

GO

SET XACT_ABORT ON;
SET NOCOUNT ON;
SET NOEXEC OFF;

GO

--
-- FONCTIONS TEMP
--

:r TempFunctions.sql

GO

--
-- DIVERS TESTS AVANT REPRISE
--

BEGIN
	declare @MaxCleSociete int;
	declare @MaxCleSecteur int;
	
	select @MaxCleSociete=max(CleSociete) from $(SourceSchemaName).[Gen_SocSociete];
	IF (@MaxCleSociete>=$(CleSecteurBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSociete].[CleSociete] est trop elevée. Changez la valeur de la constante CleSecteurBase pour continuer la reprise.';
		SET NOEXEC ON;
	END;

	select @MaxCleSecteur=max(CleSecteur) from $(SourceSchemaName).[Gen_SocSecteur];
	IF (@MaxCleSecteur>=$(CleServiceBase)) BEGIN
		PRINT 'ERREUR: La valeur maximum de [Gen_SocSecteur].[CleSecteur] est trop elevée. Changez la valeur de la constante CleServiceBase pour continuer la reprise.';
		SET NOEXEC ON;
	END;
END;

GO


:r .\Gen\Script_GenService.sql
:r .\Gen\Script_GenPersonne.sql
:r .\Gen\Script_GenCompteur.sql
:r .\Gen\Script_GenMandat.sql
:r .\Gen\Script_GenTVA.sql
:r .\Gen\Script_GenFourn.sql
:r .\Gen\Script_GenExercice.sql
:r .\Gen\Script_GenTypeIdent.sql
:r .\Gen\Script_GenCiviliteTiers.sql
:r .\Gen\Script_GenProprieteTiers.sql
:r .\Gen\Script_GenTiers.sql


GO

-- NETTOYAGE

DROP FUNCTION [dbo].[TMP_BBAN_TO_IBAN];
GO
DROP FUNCTION [dbo].[TMP_SPLIT];
GO
DROP FUNCTION [dbo].[TMP_SOC_TO_SERVICE];
GO
