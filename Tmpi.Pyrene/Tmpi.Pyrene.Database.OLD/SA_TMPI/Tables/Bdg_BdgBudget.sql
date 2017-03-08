CREATE TABLE [SA_TMPI].[Bdg_BdgBudget] (
    [CleBudget]         SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleBudget_C]       SMALLINT      NULL,
    [CleBudget_H]       SMALLINT      NOT NULL,
    [CodBudget]         VARCHAR (50)  NOT NULL,
    [AnnBudget]         SMALLINT      NOT NULL,
    [LibBudget]         VARCHAR (100) NOT NULL,
    [TxtBudget]         VARCHAR (255) NULL,
    [EstActif]          BIT           CONSTRAINT [DF_Bdg_BdgBudget_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_Bdg_BdgBudget_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT      NOT NULL,
    [DatModif]          SMALLDATETIME NULL,
    [CleOperateur]      SMALLINT      NULL,
    [DatValidation]     SMALLDATETIME NULL,
    [CleValideur]       SMALLINT      NULL,
    [EstUtilise]        BIT           CONSTRAINT [DF_Bdg_BdgBudget_EstUtilise] DEFAULT ((0)) NOT NULL,
    [EstClos]           BIT           CONSTRAINT [DF_Bdg_BdgBudget_EstClos] DEFAULT ((0)) NOT NULL,
    [TypSaisieCritere1] TINYINT       NULL,
    [TypSaisieCritere2] TINYINT       NULL,
    [TypSaisieCritere3] TINYINT       NULL,
    CONSTRAINT [PK_Bdg_BdgBudget] PRIMARY KEY CLUSTERED ([CleBudget] ASC),
    CONSTRAINT [UN_Bdg_BdgBudget] UNIQUE NONCLUSTERED ([CodBudget] ASC)
);

