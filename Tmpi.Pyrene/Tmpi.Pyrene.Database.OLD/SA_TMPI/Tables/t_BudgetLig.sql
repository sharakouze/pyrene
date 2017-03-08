﻿CREATE TABLE [SA_TMPI].[t_BudgetLig] (
    [CleBudget]        SMALLINT        NOT NULL,
    [CleExercice]      TINYINT         NOT NULL,
    [NumVersion]       TINYINT         NOT NULL,
    [CleImput]         SMALLINT        NOT NULL,
    [MntPrevu]         DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu] DEFAULT ((0)) NOT NULL,
    [MntPrevu_01]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_01] DEFAULT ((0)) NOT NULL,
    [MntPrevu_02]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_02] DEFAULT ((0)) NOT NULL,
    [MntPrevu_03]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_03] DEFAULT ((0)) NOT NULL,
    [MntPrevu_04]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_04] DEFAULT ((0)) NOT NULL,
    [MntPrevu_05]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_05] DEFAULT ((0)) NOT NULL,
    [MntPrevu_06]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_06] DEFAULT ((0)) NOT NULL,
    [MntPrevu_07]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_07] DEFAULT ((0)) NOT NULL,
    [MntPrevu_08]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_08] DEFAULT ((0)) NOT NULL,
    [MntPrevu_09]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_09] DEFAULT ((0)) NOT NULL,
    [MntPrevu_10]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_10] DEFAULT ((0)) NOT NULL,
    [MntPrevu_11]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_11] DEFAULT ((0)) NOT NULL,
    [MntPrevu_12]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntPrevu_12] DEFAULT ((0)) NOT NULL,
    [MntConsomme]      DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme] DEFAULT ((0)) NOT NULL,
    [MntConsomme_01]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_01] DEFAULT ((0)) NOT NULL,
    [MntConsomme_02]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_02] DEFAULT ((0)) NOT NULL,
    [MntConsomme_03]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_03] DEFAULT ((0)) NOT NULL,
    [MntConsomme_04]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_04] DEFAULT ((0)) NOT NULL,
    [MntConsomme_05]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_05] DEFAULT ((0)) NOT NULL,
    [MntConsomme_06]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_06] DEFAULT ((0)) NOT NULL,
    [MntConsomme_07]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_07] DEFAULT ((0)) NOT NULL,
    [MntConsomme_08]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_08] DEFAULT ((0)) NOT NULL,
    [MntConsomme_09]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_09] DEFAULT ((0)) NOT NULL,
    [MntConsomme_10]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_10] DEFAULT ((0)) NOT NULL,
    [MntConsomme_11]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_11] DEFAULT ((0)) NOT NULL,
    [MntConsomme_12]   DECIMAL (15, 2) CONSTRAINT [DF_t_BudgetLig_MntConsomme_12] DEFAULT ((0)) NOT NULL,
    [ValCoef]          SMALLINT        CONSTRAINT [DF_t_BudgetLig_ValCoef] DEFAULT ((0)) NOT NULL,
    [CleBudgetVersion] INT             NULL,
    CONSTRAINT [PK_t_BudgetLig] PRIMARY KEY CLUSTERED ([CleBudget] ASC, [CleExercice] ASC, [CleImput] ASC, [NumVersion] ASC),
    CONSTRAINT [FK1_t_BudgetLig] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[t_Budget] ([CleBudget]),
    CONSTRAINT [FK2_t_BudgetLig] FOREIGN KEY ([CleImput]) REFERENCES [SA_TMPI].[t_Imput] ([CleImput]),
    CONSTRAINT [FK3_t_BudgetLig] FOREIGN KEY ([CleBudgetVersion]) REFERENCES [SA_TMPI].[t_BudgetVersion] ([CleBudgetVersion])
);
