CREATE TABLE [SA_TMPI].[TrnP_RscPersonne] (
    [CleFamille]  SMALLINT NULL,
    [ClePersonne] SMALLINT NOT NULL,
    [EstPartage]  BIT      NOT NULL,
    CONSTRAINT [PK_TrnP_RscPersonne] PRIMARY KEY CLUSTERED ([ClePersonne] ASC),
    CONSTRAINT [FK1_TrnP_RscPersonne] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[TrnP_Rsc_Famille] ([CleFamille]),
    CONSTRAINT [FK2_TrnP_RscPersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

