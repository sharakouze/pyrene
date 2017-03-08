CREATE TABLE [SA_TMPI].[t_Unite] (
    [CleUnite]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodUnite]      VARCHAR (50)  NOT NULL,
    [LibUnite]      VARCHAR (100) NOT NULL,
    [CleFUnite]     TINYINT       NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_Unite_DatSaisie] DEFAULT (getdate()) NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_Unite_CleOperateur] DEFAULT ((0)) NULL,
    [NumVersion]    TINYINT       CONSTRAINT [DF_t_Unite_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_Unite] PRIMARY KEY CLUSTERED ([CleUnite] ASC),
    CONSTRAINT [UN1_t_Unite] UNIQUE NONCLUSTERED ([CodUnite] ASC)
);

