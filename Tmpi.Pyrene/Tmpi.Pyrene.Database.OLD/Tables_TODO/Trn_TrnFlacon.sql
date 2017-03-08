CREATE TABLE [SA_TMPI].[Trn_TrnFlacon] (
    [CleTrnFlacon] INT            IDENTITY (1, 1) NOT NULL,
    [CleTournee]   INT            NOT NULL,
    [CleTrnEchant] INT            NOT NULL,
    [NumEtiquette] VARCHAR (4000) NULL,
    [CleArticle]   INT            NOT NULL,
    CONSTRAINT [PK_Trn_TrnFlacont] PRIMARY KEY CLUSTERED ([CleTrnFlacon] ASC),
    CONSTRAINT [FK_Trn_TrnFlacon_CleArticle] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK_Trn_TrnFlacon_CleTournee] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK_Trn_TrnFlacon_CleTrnEchant] FOREIGN KEY ([CleTrnEchant]) REFERENCES [SA_TMPI].[Trn_TrnEchant] ([CleTrnEchant])
);


GO
CREATE NONCLUSTERED INDEX [IX_Trn_TrnFlacon_CleTournee]
    ON [SA_TMPI].[Trn_TrnFlacon]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Trn_TrnFlacon_CleTrnEchant]
    ON [SA_TMPI].[Trn_TrnFlacon]([CleTrnEchant] ASC);

