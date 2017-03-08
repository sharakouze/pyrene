CREATE TABLE [SA_TMPI].[Bdg_BdgService] (
    [CleBudget]  SMALLINT NOT NULL,
    [CleService] SMALLINT NOT NULL,
    CONSTRAINT [PK_Bdg_BdgService] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [CleService] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_BdgService]
    ON [SA_TMPI].[Bdg_BdgService]([CleBudget] ASC);

