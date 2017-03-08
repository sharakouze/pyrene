CREATE TABLE [SA_TMPI].[Bdg_BdgSection] (
    [CleBudget]  SMALLINT NOT NULL,
    [CleSection] SMALLINT NOT NULL,
    CONSTRAINT [PK_Bdg_BdgSection] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [CleSection] ASC),
    CONSTRAINT [FK1_Bdg_BdgSection] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[Bdg_BdgBudget] ([CleBudget]),
    CONSTRAINT [FK2_Bdg_BdgSection] FOREIGN KEY ([CleSection]) REFERENCES [SA_TMPI].[Bdg_Bdg_Section] ([CleSection])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_BdgSection]
    ON [SA_TMPI].[Bdg_BdgSection]([CleBudget] ASC);

