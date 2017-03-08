CREATE TABLE [SA_TMPI].[t_Devise] (
    [CleDevise]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [CodDevise]     VARCHAR (50)  NOT NULL,
    [LibDevise]     VARCHAR (100) NOT NULL,
    [DatSaisie]     DATETIME      NULL,
    [CleOperateur]  SMALLINT      NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_Devise] PRIMARY KEY CLUSTERED ([CleDevise] ASC),
    CONSTRAINT [UN1_t_Devise] UNIQUE NONCLUSTERED ([CodDevise] ASC)
);

