CREATE TABLE [SA_TMPI].[t_EquListeVal] (
    [CleListe]      SMALLINT      NOT NULL,
    [CleValeur]     INT           IDENTITY (1, 1) NOT NULL,
    [CodValeur]     VARCHAR (50)  NOT NULL,
    [LibValeur]     VARCHAR (100) NOT NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquListeVal] PRIMARY KEY CLUSTERED ([CleValeur] ASC),
    CONSTRAINT [UN_t_EquListeVal] UNIQUE NONCLUSTERED ([CleListe] ASC, [CodValeur] ASC)
);

