CREATE TABLE [SA_TMPI].[t_BudAffect] (
    [CleAffect]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodAffect]     VARCHAR (50)   NOT NULL,
    [LibAffect]     VARCHAR (100)  NOT NULL,
    [TxtAffect]     VARCHAR (255)  NULL,
    [TauRecup]      DECIMAL (5, 2) CONSTRAINT [DF_t_BudAffect_TauRecup] DEFAULT ((0)) NOT NULL,
    [DatSaisie]     DATETIME       CONSTRAINT [DF_t_BudAffect_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT       CONSTRAINT [DF_t_BudAffect_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT        CONSTRAINT [DF_t_BudAffect_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_t_BudAffect] PRIMARY KEY CLUSTERED ([CleAffect] ASC),
    CONSTRAINT [UN_t_BudAffect] UNIQUE NONCLUSTERED ([CodAffect] ASC)
);

