CREATE TABLE [SA_TMPI].[t_ArticleMagasin] (
    [CleArticle]             INT             NOT NULL,
    [CleMagasin]             SMALLINT        NOT NULL,
    [QteStock]               DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteStock] DEFAULT ((0)) NOT NULL,
    [QteStockMin]            DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteStockMin] DEFAULT ((0)) NOT NULL,
    [QteStockMax]            DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteStockMax] DEFAULT ((0)) NOT NULL,
    [QteAppro]               DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteAppro] DEFAULT ((0)) NOT NULL,
    [QteDemandee]            DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteDemandee] DEFAULT ((0)) NOT NULL,
    [QteCommandee]           DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteCommandee] DEFAULT ((0)) NOT NULL,
    [QteAValider]            DECIMAL (15, 3) CONSTRAINT [DF_t_ArticleMagasin_QteAValider] DEFAULT ((0)) NOT NULL,
    [CleLocal]               SMALLINT        NULL,
    [IndCdeAuto]             BIT             CONSTRAINT [DF_t_ArticleMagasin_IndCdeAuto] DEFAULT ((0)) NOT NULL,
    [EstPasGere]             BIT             CONSTRAINT [DF_t_ArticleMagasin_EstPasGere] DEFAULT ((0)) NOT NULL,
    [EstGere]                BIT             CONSTRAINT [DF_t_ArticleMagasin_EstGere] DEFAULT ((1)) NOT NULL,
    [EstLotAValider]         BIT             CONSTRAINT [DF_t_ArticleMagasin_EstLotAValider] DEFAULT ((0)) NOT NULL,
    [EstEtiquetteSecondaire] BIT             CONSTRAINT [DF_t_ArticleMagasin_EstEtiquetteSecondaire] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_ArticleMagasin] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [CleMagasin] ASC),
    CONSTRAINT [FK1_t_ArticleMagasin] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_t_ArticleMagasin] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin])
);

