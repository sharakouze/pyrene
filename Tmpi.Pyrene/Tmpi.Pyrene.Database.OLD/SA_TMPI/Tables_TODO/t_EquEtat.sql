CREATE TABLE [SA_TMPI].[t_EquEtat] (
    [CleEtat]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodEtat]       VARCHAR (50)  NOT NULL,
    [LibEtat]       VARCHAR (100) NOT NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_EquEtat] PRIMARY KEY CLUSTERED ([CleEtat] ASC),
    CONSTRAINT [UN_EquEtat] UNIQUE NONCLUSTERED ([CodEtat] ASC)
);

