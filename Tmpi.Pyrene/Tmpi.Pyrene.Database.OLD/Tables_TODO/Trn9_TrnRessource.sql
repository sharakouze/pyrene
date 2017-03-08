CREATE TABLE [SA_TMPI].[Trn9_TrnRessource] (
    [CleTournee]     INT      NOT NULL,
    [CleTache]       INT      NOT NULL,
    [CleFamille]     SMALLINT NOT NULL,
    [QteRessource]   SMALLINT NOT NULL,
    [CleReservation] INT      NOT NULL,
    [CleTache_Old]   INT      NULL,
    CONSTRAINT [PK_Trn9_TrnRessource] PRIMARY KEY CLUSTERED ([CleFamille] ASC, [CleTache] ASC),
    CONSTRAINT [FK1_Trn9_TrnRessource] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn9_TrnTache] ([CleTache])
);

