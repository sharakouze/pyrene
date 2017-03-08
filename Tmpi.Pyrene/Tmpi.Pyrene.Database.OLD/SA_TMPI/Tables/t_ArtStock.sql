CREATE TABLE [SA_TMPI].[t_ArtStock] (
    [CleStock]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodStock]      VARCHAR (50)  NOT NULL,
    [LibStock]      VARCHAR (100) NOT NULL,
    [TxtStock]      VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_ArtStock] PRIMARY KEY CLUSTERED ([CleStock] ASC),
    CONSTRAINT [UN_t_ArtStock] UNIQUE NONCLUSTERED ([CodStock] ASC)
);

