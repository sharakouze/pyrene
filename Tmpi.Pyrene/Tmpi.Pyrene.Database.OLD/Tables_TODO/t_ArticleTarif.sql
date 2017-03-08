CREATE TABLE [SA_TMPI].[t_ArticleTarif] (
    [CleArticleTarif] INT             IDENTITY (1, 1) NOT NULL,
    [CleArticle]      INT             NOT NULL,
    [CleFabricant]    SMALLINT        NOT NULL,
    [CleFourn]        SMALLINT        NOT NULL,
    [RefArticle]      VARCHAR (50)    NULL,
    [LibArticle]      VARCHAR (100)   NOT NULL,
    [CleCondition_L]  SMALLINT        NULL,
    [CleCondition_F]  SMALLINT        NULL,
    [CleDevise]       TINYINT         NULL,
    [PrxUnitaire]     DECIMAL (15, 4) CONSTRAINT [DF_t_ArticleTarif_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauRemise]       DECIMAL (5, 2)  CONSTRAINT [DF_t_ArticleTarif_TauRemise] DEFAULT ((0)) NOT NULL,
    [DelLivraison]    TINYINT         NULL,
    [IndDefaut]       BIT             CONSTRAINT [DF_t_ArticleTarif_IndDefaut] DEFAULT ((0)) NOT NULL,
    [CleMarche]       SMALLINT        NULL,
    [CleMarcheLot]    SMALLINT        NULL,
    [DatDebut]        DATETIME        NULL,
    [DatFin]          DATETIME        NULL,
    [DatSaisie]       DATETIME        CONSTRAINT [DF_t_ArticleTarif_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]    SMALLINT        CONSTRAINT [DF_t_ArticleTarif_CleOperateur] DEFAULT ((0)) NOT NULL,
    [ValConditionB]   DECIMAL (10, 3) CONSTRAINT [DF_t_ArticleTarif_ValConditionB] DEFAULT ((1)) NOT NULL,
    [CleUnite]        SMALLINT        NOT NULL,
    [ValConditionL]   DECIMAL (10, 3) CONSTRAINT [DF_t_ArticleTarif_ValConditionL] DEFAULT ((1)) NOT NULL,
    [ValConditionF]   DECIMAL (10, 3) CONSTRAINT [DF_t_ArticleTarif_ValConditionF] DEFAULT ((1)) NOT NULL,
    [NumLotM]         VARCHAR (50)    NULL,
    [LibConditionB]   VARCHAR (100)   NULL,
    [MntEcoTaxe]      DECIMAL (9, 4)  CONSTRAINT [DF_t_ArticleTarif_MntEcoTaxe] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_ArticleTarif] PRIMARY KEY CLUSTERED ([CleArticleTarif] ASC),
    CONSTRAINT [FK1_T_ArticleTarif] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_T_ArticleTarif] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK3_T_ArticleTarif] FOREIGN KEY ([CleFabricant]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK4_T_ArticleTarif] FOREIGN KEY ([CleMarche]) REFERENCES [SA_TMPI].[t_FouMarche] ([CleMarche])
);


GO
CREATE NONCLUSTERED INDEX [ID1_ArticleTarif]
    ON [SA_TMPI].[t_ArticleTarif]([CleArticle] ASC) WITH (FILLFACTOR = 90);

