SET XACT_ABORT ON;
SET NOCOUNT ON;
SET NOEXEC OFF;

GO

--
-- CONSTANTES POUR LA REPRISE
--

:setvar SourceSchemaName "[CG66_PYRENE_DLB].[SA_TMPI]"

:setvar CleSecteurBase "1000"
:setvar CleServiceBase "20000"

GO

--
-- FONCTIONS TEMP
--

:r TempFunctions.sql

GO

:r Script1.sql

GO
