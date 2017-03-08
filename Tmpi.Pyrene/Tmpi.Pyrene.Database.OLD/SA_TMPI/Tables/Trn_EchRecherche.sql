CREATE TABLE [SA_TMPI].[Trn_EchRecherche] (
    [CleEchRecherche] INT           IDENTITY (1, 1) NOT NULL,
    [CleTournee]      INT           NULL,
    [CleDemTache]     INT           NULL,
    [CleProduit]      INT           NULL,
    [CleConfig]       INT           NULL,
    [ClePoint]        INT           NULL,
    [NbrEchant]       TINYINT       NULL,
    [CleConfigLigne]  INT           NULL,
    [NumOrdre]        INT           NULL,
    [ValResultat]     NVARCHAR (50) NULL,
    [ValResultatN]    VARCHAR (50)  NULL,
    [ValResultatD]    VARCHAR (50)  NULL,
    [CleOperateur]    INT           NULL,
    [DatModif]        DATETIME      NULL
);

