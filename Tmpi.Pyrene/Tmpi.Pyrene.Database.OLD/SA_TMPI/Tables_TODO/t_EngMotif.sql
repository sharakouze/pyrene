CREATE TABLE [SA_TMPI].[t_EngMotif] (
    [CleMotif]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodMotif]      VARCHAR (50)  NOT NULL,
    [LibMotif]      VARCHAR (100) NOT NULL,
    [TxtMotif]      VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EngMotif] PRIMARY KEY CLUSTERED ([CleMotif] ASC),
    CONSTRAINT [UN1_t_EngMotif] UNIQUE NONCLUSTERED ([CodMotif] ASC)
);

