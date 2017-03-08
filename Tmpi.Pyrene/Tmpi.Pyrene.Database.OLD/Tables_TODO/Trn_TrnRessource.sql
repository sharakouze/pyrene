CREATE TABLE [SA_TMPI].[Trn_TrnRessource] (
    [CleTache]        INT      NOT NULL,
    [CleTypRessource] SMALLINT NOT NULL,
    [QteRessource]    SMALLINT NOT NULL,
    [CleReservation]  INT      NOT NULL,
    [CleTache_Old]    INT      NULL,
    CONSTRAINT [PK_Trn_TrnRessource] PRIMARY KEY CLUSTERED ([CleTache] ASC, [CleTypRessource] ASC),
    CONSTRAINT [FK1_Trn_TrnRessource] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache])
);

