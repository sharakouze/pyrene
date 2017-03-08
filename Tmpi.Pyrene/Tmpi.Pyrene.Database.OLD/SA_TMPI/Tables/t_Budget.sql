CREATE TABLE [SA_TMPI].[t_Budget] (
    [CleBudget]        SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodBudget]        VARCHAR (50)  NOT NULL,
    [LibBudget]        VARCHAR (100) NOT NULL,
    [TxtBudget]        VARCHAR (255) NULL,
    [CleExercice]      TINYINT       NOT NULL,
    [NumVersion]       TINYINT       CONSTRAINT [DF_t_Budget_NumVersion] DEFAULT ((0)) NULL,
    [DatSaisie]        DATETIME      NULL,
    [CleOperateur]     SMALLINT      NULL,
    [DatValidation]    DATETIME      NULL,
    [CleValideur]      SMALLINT      NULL,
    [CleBudgetVersion] INT           NULL,
    CONSTRAINT [PK_t_Budget] PRIMARY KEY CLUSTERED ([CleBudget] ASC),
    CONSTRAINT [UN_t_Budget] UNIQUE NONCLUSTERED ([CodBudget] ASC)
);

