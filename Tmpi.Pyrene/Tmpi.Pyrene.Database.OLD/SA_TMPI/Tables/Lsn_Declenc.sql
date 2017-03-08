CREATE TABLE [SA_TMPI].[Lsn_Declenc] (
    [CleDeclenc]    INT           NOT NULL,
    [CodDeclenc]    VARCHAR (50)  NOT NULL,
    [LibDeclenc]    VARCHAR (100) NOT NULL,
    [TxtDeclenc]    VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Lsn_Declenc] PRIMARY KEY CLUSTERED ([CleDeclenc] ASC),
    CONSTRAINT [UN_Lsn_Declenc] UNIQUE NONCLUSTERED ([CodDeclenc] ASC)
);

