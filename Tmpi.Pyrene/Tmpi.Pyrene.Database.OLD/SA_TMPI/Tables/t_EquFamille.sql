CREATE TABLE [SA_TMPI].[t_EquFamille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_EquFamille_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_EquFamille_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_t_EquFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

