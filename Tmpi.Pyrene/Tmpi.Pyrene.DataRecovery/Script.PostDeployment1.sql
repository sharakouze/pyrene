SET XACT_ABORT ON;
SET NOCOUNT ON;

GO

:setvar SourceSchemaName "[CG66_PYRENE_DLB].[SA_TMPI]"

GO

--
-- FONCTIONS TEMP
--

:r TempFunctions.sql

GO

:r Script1.sql
