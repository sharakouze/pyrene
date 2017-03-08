CREATE TABLE [SA_TMPI].[Trn9_TrnEchantillon] (
    [CleTournee]         INT           NOT NULL,
    [CleTache]           INT           NOT NULL,
    [CleTrnEchantillon]  INT           NOT NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon_Int] VARCHAR (100) NOT NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [CleMatrice]         SMALLINT      NOT NULL,
    [CleProduit]         SMALLINT      NOT NULL,
    [DurPrelevement]     SMALLINT      NOT NULL,
    [DatPrelevement]     SMALLDATETIME NULL,
    [HeuPrelevement]     SMALLINT      NULL,
    CONSTRAINT [PK_Trn9_TrnEchantillon] PRIMARY KEY CLUSTERED ([CleTrnEchantillon] ASC),
    CONSTRAINT [FK1_Trn9_TrnEchantillon] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn9_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK2_Trn9_TrnEchantillon] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn9_TrnTache] ([CleTache])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn9_TrnEchantillon]
    ON [SA_TMPI].[Trn9_TrnEchantillon]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn9_TrnEchantillon]
    ON [SA_TMPI].[Trn9_TrnEchantillon]([CleTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Trn9_TrnEchantillon]
    ON [SA_TMPI].[Trn9_TrnEchantillon]([CleMatrice] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Trn9_TrnEchantillon]
    ON [SA_TMPI].[Trn9_TrnEchantillon]([CleProduit] ASC);

