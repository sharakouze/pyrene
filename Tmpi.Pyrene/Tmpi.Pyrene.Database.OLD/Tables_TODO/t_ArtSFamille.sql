CREATE TABLE [SA_TMPI].[t_ArtSFamille] (
    [CleFamille]    SMALLINT      NOT NULL,
    [CleSFamille]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodSFamille]   VARCHAR (50)  NOT NULL,
    [LibSFamille]   VARCHAR (100) NOT NULL,
    [TxtSFamille]   VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_ArtSFamille_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_ArtSFamille_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_ArtSFamille] PRIMARY KEY CLUSTERED ([CleSFamille] ASC),
    CONSTRAINT [FK1_t_ArtSFamille] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[t_ArtFamille] ([CleFamille]),
    CONSTRAINT [UN_t_ArtSFamille] UNIQUE NONCLUSTERED ([CleFamille] ASC, [CodSFamille] ASC)
);

