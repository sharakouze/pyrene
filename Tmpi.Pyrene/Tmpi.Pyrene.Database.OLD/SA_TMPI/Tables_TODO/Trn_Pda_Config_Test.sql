CREATE TABLE [SA_TMPI].[Trn_Pda_Config_Test] (
    [CleProduit]   INT             NOT NULL,
    [CleTest]      INT             IDENTITY (1, 1) NOT NULL,
    [LibParametre] CHAR (50)       NULL,
    [NumOrdre]     INT             NULL,
    [ValResultat]  CHAR (50)       NULL,
    [ValResultatN] DECIMAL (10, 3) NULL,
    [ValResultatD] DATETIME        NULL,
    [DatModif]     DATETIME        NOT NULL,
    [CleOperateur] INT             NULL,
    [CleConfig]    INT             NULL,
    [CleCodValeur] INT             NULL
);

