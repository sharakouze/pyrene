CREATE TABLE [SA_TMPI].[Bdg_BdgPersonne] (
    [CleBudget]   SMALLINT NOT NULL,
    [ClePersonne] SMALLINT NOT NULL,
    [EstNiveau1]  BIT      CONSTRAINT [DF_Bdg_BdgPersonne_EstNiveau1] DEFAULT ((0)) NOT NULL,
    [EstNiveau2]  BIT      CONSTRAINT [DF_Bdg_BdgPersonne_EstNiveau2] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Bdg_BdgPersonne] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [ClePersonne] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_BdgPersonne]
    ON [SA_TMPI].[Bdg_BdgPersonne]([CleBudget] ASC);

