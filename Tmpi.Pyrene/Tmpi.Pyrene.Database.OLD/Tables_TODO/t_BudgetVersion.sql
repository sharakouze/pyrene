CREATE TABLE [SA_TMPI].[t_BudgetVersion] (
    [CleBudget]        SMALLINT      NOT NULL,
    [CleExercice]      SMALLINT      NOT NULL,
    [NumVersion]       TINYINT       NULL,
    [DatValidation]    DATETIME      NULL,
    [CleValideur]      SMALLINT      NULL,
    [CleBudgetVersion] INT           IDENTITY (1, 1) NOT NULL,
    [DatSaisie]        DATETIME      NULL,
    [CleOperateur]     SMALLINT      NULL,
    [NivSaisie]        TINYINT       NULL,
    [TxtVersion]       VARCHAR (255) NULL,
    CONSTRAINT [PK_t_BudgetVersion] PRIMARY KEY CLUSTERED ([CleBudgetVersion] ASC),
    CONSTRAINT [FK1_t_BudgetVersion] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[t_Budget] ([CleBudget]),
    CONSTRAINT [FK2_t_BudgetVersion] FOREIGN KEY ([CleExercice]) REFERENCES [SA_TMPI].[Gen_DivExercice] ([CleExercice]),
    CONSTRAINT [UN_t_BudgetVersion] UNIQUE NONCLUSTERED ([CleBudget] ASC, [CleExercice] ASC, [NumVersion] ASC)
);

