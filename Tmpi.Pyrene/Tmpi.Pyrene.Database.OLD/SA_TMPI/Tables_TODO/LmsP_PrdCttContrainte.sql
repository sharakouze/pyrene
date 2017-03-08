CREATE TABLE [SA_TMPI].[LmsP_PrdCttContrainte] (
    [CleProduit]       SMALLINT      NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [ClePrdContrainte] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleContrainte]    SMALLINT      NULL,
    [DatExpiration]    SMALLDATETIME NULL,
    [LstValeur]        VARCHAR (500) NULL,
    CONSTRAINT [PK_LmsP_PrdCttContrainte] PRIMARY KEY CLUSTERED ([ClePrdContrainte] ASC),
    CONSTRAINT [FK1_LmsP_PrdCttContrainte] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK2_LmsP_PrdCttContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [UN_LmsP_PrdCttContrainte] UNIQUE NONCLUSTERED ([CleProduit] ASC, [TypContrainte] ASC, [CleContrainte] ASC)
);

