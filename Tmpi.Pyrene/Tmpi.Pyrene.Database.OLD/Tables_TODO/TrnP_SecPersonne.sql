CREATE TABLE [SA_TMPI].[TrnP_SecPersonne] (
    [CleSecteur]  SMALLINT NOT NULL,
    [ClePersonne] SMALLINT NOT NULL,
    CONSTRAINT [PK_TrnP_SecPersonne] PRIMARY KEY CLUSTERED ([CleSecteur] ASC, [ClePersonne] ASC),
    CONSTRAINT [FK1_TrnP_SecPersonne] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_TrnP_SecPersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

