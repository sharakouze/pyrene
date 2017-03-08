CREATE TABLE [SA_TMPI].[t_ArtLocal] (
    [CleLocal]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodLocal]      VARCHAR (50)  NOT NULL,
    [LibLocal]      VARCHAR (100) NOT NULL,
    [TxtLocal]      VARCHAR (255) NULL,
    [CleMagasin]    SMALLINT      NOT NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_ArtLocal_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_ArtLocal_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_ArtLocal] PRIMARY KEY CLUSTERED ([CleLocal] ASC),
    CONSTRAINT [FK1_t_ArtLocal] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [UN_t_ArtLocal] UNIQUE NONCLUSTERED ([CleMagasin] ASC, [CodLocal] ASC)
);

