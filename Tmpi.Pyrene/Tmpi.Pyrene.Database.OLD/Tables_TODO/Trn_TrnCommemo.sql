CREATE TABLE [SA_TMPI].[Trn_TrnCommemo] (
    [CleTache]      INT             NOT NULL,
    [CleTrnEchant]  INT             NOT NULL,
    [CleTrnCommemo] INT             IDENTITY (1, 1) NOT NULL,
    [CleProduit]    SMALLINT        NOT NULL,
    [TypCommemo]    TINYINT         NOT NULL,
    [CleCommemo]    SMALLINT        NOT NULL,
    [ValResultat]   VARCHAR (1000)  NULL,
    [ValResultatN]  DECIMAL (21, 8) NULL,
    [ValResultatD]  SMALLDATETIME   NULL,
    [ValResultatL]  SMALLINT        NULL,
    [OpeResultat]   VARCHAR (2)     NULL,
    [CleTache_Old]  INT             NULL,
    [EstActif]      BIT             DEFAULT ((1)) NOT NULL,
    [DatModif]      SMALLDATETIME   NULL,
    [DatCreation]   SMALLDATETIME   CONSTRAINT [DF_Trn_TrnCommemo_DatCreation] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Trn_TrnCommemo] PRIMARY KEY CLUSTERED ([CleTrnCommemo] ASC),
    CONSTRAINT [FK1_Trn_Commemo] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache]),
    CONSTRAINT [FK1_Trn_TrnCommemo] FOREIGN KEY ([CleTrnEchant]) REFERENCES [SA_TMPI].[Trn_TrnEchant] ([CleTrnEchant]),
    CONSTRAINT [FK2_Trn_TrnCommemo] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK3_Trn_TrnCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_TrnCommemo]
    ON [SA_TMPI].[Trn_TrnCommemo]([CleTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_TrnCommemo]
    ON [SA_TMPI].[Trn_TrnCommemo]([CleTrnEchant] ASC);

