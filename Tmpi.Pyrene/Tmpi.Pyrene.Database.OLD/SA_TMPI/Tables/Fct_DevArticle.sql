CREATE TABLE [SA_TMPI].[Fct_DevArticle] (
    [CleDevis]        INT             NOT NULL,
    [ClePrelevement]  INT             NOT NULL,
    [CleArticle]      INT             IDENTITY (1, 1) NOT NULL,
    [NumOrdre]        SMALLINT        NOT NULL,
    [CleTarifArticle] INT             NOT NULL,
    [CleGroupeP]      INT             NULL,
    [CleParametre]    INT             NULL,
    [CleMethode]      INT             NULL,
    [EstAccredite]    BIT             CONSTRAINT [DF_Fct_DevArticle_EstAccredite] DEFAULT ((1)) NOT NULL,
    [PrxTarif]        DECIMAL (10, 2) NULL,
    [TauRemise]       DECIMAL (5, 2)  NULL,
    [PrxUnitaire]     DECIMAL (10, 2) NULL,
    CONSTRAINT [PK_Fct_DevArticle] PRIMARY KEY CLUSTERED ([CleArticle] ASC)
);

