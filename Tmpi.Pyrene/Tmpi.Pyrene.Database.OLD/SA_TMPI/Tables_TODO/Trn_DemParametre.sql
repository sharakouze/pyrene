CREATE TABLE [SA_TMPI].[Trn_DemParametre] (
    [CleDemTache]  INT      NOT NULL,
    [CleProduit]   SMALLINT NOT NULL,
    [CleGroupeP]   SMALLINT NULL,
    [CleParametre] INT      NULL,
    [EstReference] BIT      NOT NULL,
    [TypMouvement] TINYINT  NOT NULL,
    CONSTRAINT [FK1_Trn_DemParametre] FOREIGN KEY ([CleDemTache]) REFERENCES [SA_TMPI].[Trn_DemTache] ([CleDemTache]),
    CONSTRAINT [UN_Trn_DemParametre] UNIQUE NONCLUSTERED ([CleDemTache] ASC, [CleGroupeP] ASC, [CleParametre] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemParametre]
    ON [SA_TMPI].[Trn_DemParametre]([CleDemTache] ASC);

