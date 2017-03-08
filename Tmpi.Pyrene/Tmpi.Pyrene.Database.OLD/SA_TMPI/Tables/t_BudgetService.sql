CREATE TABLE [SA_TMPI].[t_BudgetService] (
    [CleBudget]  SMALLINT NOT NULL,
    [CleService] SMALLINT NOT NULL,
    CONSTRAINT [PK_t_BudgetService] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [CleService] ASC),
    CONSTRAINT [FK1_t_BudgetService] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[t_Budget] ([CleBudget]),
    CONSTRAINT [FK2_t_BudgetService] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService])
);

