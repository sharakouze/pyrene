CREATE TABLE [SA_TMPI].[Trn_TrnEchant] (
    [CleTournee]     INT           NOT NULL,
    [ClePoint]       INT           NOT NULL,
    [CleTrnEchant]   INT           IDENTITY (1, 1) NOT NULL,
    [NumEchant]      VARCHAR (25)  NOT NULL,
    [NumEchantExt]   VARCHAR (25)  NULL,
    [NumOrdre]       SMALLINT      NULL,
    [CleTache]       INT           NOT NULL,
    [CleMatrice]     SMALLINT      NULL,
    [CleProduit]     SMALLINT      NULL,
    [DatPrelevement] SMALLDATETIME NULL,
    [HeuPrelevement] SMALLINT      NULL,
    [CleTache_Old]   INT           NULL,
    [EstActif]       BIT           DEFAULT ((1)) NOT NULL,
    [DatModif]       SMALLDATETIME NULL,
    [DatCreation]    SMALLDATETIME CONSTRAINT [DF_Trn_TrnEchant_DatCreation] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Trn_TrnEchant] PRIMARY KEY CLUSTERED ([CleTrnEchant] ASC),
    CONSTRAINT [FK1_Trn_TrnEchant] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache]),
    CONSTRAINT [FK2_Trn_TrnEchant] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK4_Trn_TrnEchant] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK5_Trn_TrnEchant] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice])
);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_TrnEchant]
    ON [SA_TMPI].[Trn_TrnEchant]([CleTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_TrnEchant]
    ON [SA_TMPI].[Trn_TrnEchant]([CleTournee] ASC);

