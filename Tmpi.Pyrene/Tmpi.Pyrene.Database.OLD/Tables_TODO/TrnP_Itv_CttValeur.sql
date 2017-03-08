CREATE TABLE [SA_TMPI].[TrnP_Itv_CttValeur] (
    [CleContrainte] SMALLINT      NULL,
    [CleCttValeur]  SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodValeur]     VARCHAR (100) NULL,
    [LibValeur]     VARCHAR (500) NULL,
    CONSTRAINT [PK_TrnP_Itv_CttValeur] PRIMARY KEY CLUSTERED ([CleCttValeur] ASC),
    CONSTRAINT [FK1_TrnP_Itv_CttContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [UN_TrnP_Itv_CttValeur] UNIQUE NONCLUSTERED ([CleContrainte] ASC, [CodValeur] ASC)
);

