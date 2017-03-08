CREATE TABLE [SA_TMPI].[t_ArtFamille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [CleDomaine]    SMALLINT      NOT NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_ArtFamille_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_ArtFamille_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_ArtFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [FK1_t_ArtFamille] FOREIGN KEY ([CleDomaine]) REFERENCES [SA_TMPI].[t_Domaine] ([CleDomaine]),
    CONSTRAINT [UN_t_ArtFamille] UNIQUE NONCLUSTERED ([CleDomaine] ASC, [CodFamille] ASC)
);

