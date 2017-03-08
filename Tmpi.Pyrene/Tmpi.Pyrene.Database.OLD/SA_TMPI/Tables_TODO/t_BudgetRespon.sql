CREATE TABLE [SA_TMPI].[t_BudgetRespon] (
    [CleBudget]  SMALLINT NOT NULL,
    [CleRespon]  SMALLINT NOT NULL,
    [MntPlafond] INT      CONSTRAINT [DF_t_BudgetRespon_MntPlafond] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_t_BudgetRespon] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [CleRespon] ASC),
    CONSTRAINT [FK1_t_BudgetRespon] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[t_Budget] ([CleBudget]),
    CONSTRAINT [FK2_t_BudgetRespon] FOREIGN KEY ([CleRespon]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

