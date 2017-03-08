CREATE TABLE [SA_TMPI].[t_EquSFamille] (
    [CleFamille]    SMALLINT      NOT NULL,
    [CleSFamille]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodSFamille]   VARCHAR (50)  NOT NULL,
    [LibSFamille]   VARCHAR (100) NOT NULL,
    [TxtSFamille]   VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquSFamille] PRIMARY KEY CLUSTERED ([CleSFamille] ASC),
    CONSTRAINT [FK1_t_EquSFamille] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[t_EquFamille] ([CleFamille]),
    CONSTRAINT [UN_t_EquSFamille] UNIQUE NONCLUSTERED ([CleFamille] ASC, [CodSFamille] ASC)
);

