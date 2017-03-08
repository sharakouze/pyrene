CREATE TABLE [SA_TMPI].[TrnP_PntCttContrainte] (
    [ClePoint]         INT           NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [ClePntContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [CleContrainte]    SMALLINT      NULL,
    [DatExpiration]    SMALLDATETIME NULL,
    [LstValeur]        VARCHAR (500) NULL,
    CONSTRAINT [PK_TrnP_PntCttContrainte] PRIMARY KEY CLUSTERED ([ClePntContrainte] ASC),
    CONSTRAINT [FK1_TrnP_PntCttContrainte] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint]),
    CONSTRAINT [FK2_TrnPCttContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [UN_TrnP_PntCttContrainte] UNIQUE NONCLUSTERED ([ClePoint] ASC, [TypContrainte] ASC, [CleContrainte] ASC)
);

