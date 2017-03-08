CREATE TABLE [SA_TMPI].[t_JournalStock] (
    [CleMagasin]    TINYINT         NOT NULL,
    [CleService]    SMALLINT        NULL,
    [CleArticle]    INT             NOT NULL,
    [TypMouvement]  TINYINT         CONSTRAINT [DF_t_JournalStock_TypMouvement] DEFAULT ((0)) NOT NULL,
    [DatMouvement]  DATETIME        CONSTRAINT [DF_t_JournalStock_DatMouvement] DEFAULT (getdate()) NOT NULL,
    [QteArticle]    DECIMAL (15, 3) CONSTRAINT [DF_t_JournalStock_QteArticle] DEFAULT ((0)) NOT NULL,
    [CleLot]        INT             NULL,
    [CleImput]      SMALLINT        NULL,
    [TypObjet]      TINYINT         NULL,
    [CleObjet]      INT             NULL,
    [CleOperateur]  SMALLINT        NULL,
    [IndTransfert]  BIT             CONSTRAINT [DF_t_JournalStock_IndTransfert] DEFAULT ((0)) NOT NULL,
    [QteStockAvant] DECIMAL (15, 3) NULL,
    [QteStockApres] DECIMAL (15, 3) NULL,
    CONSTRAINT [FK1_t_JournalStock] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK3_T_JOURNALSTOCK] FOREIGN KEY ([CleLot]) REFERENCES [SA_TMPI].[t_Lot] ([CleLot])
);

