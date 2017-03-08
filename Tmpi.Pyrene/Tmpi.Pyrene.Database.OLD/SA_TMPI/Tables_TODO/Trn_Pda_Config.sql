CREATE TABLE [SA_TMPI].[Trn_Pda_Config] (
    [CleProduit]    INT      NULL,
    [CleConfig]     INT      IDENTITY (1, 1) NOT NULL,
    [IndActif]      BIT      NULL,
    [DatModif]      DATETIME NOT NULL,
    [CleOperateur]  INT      NULL,
    [DatValidation] DATETIME NULL,
    [CleValideur]   INT      NULL
);

