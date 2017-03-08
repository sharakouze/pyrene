CREATE TABLE [SA_TMPI].[Gen_Pays] (
    [ClePays]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodPays]       VARCHAR (50)  NOT NULL,
    [LibPays]       VARCHAR (100) NOT NULL,
    [DatModif]      DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gen_Pays] PRIMARY KEY CLUSTERED ([ClePays] ASC),
    CONSTRAINT [UN_Gen_Pays] UNIQUE NONCLUSTERED ([CodPays] ASC)
);

