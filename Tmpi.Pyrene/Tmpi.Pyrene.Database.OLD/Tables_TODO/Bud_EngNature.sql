CREATE TABLE [SA_TMPI].[Bud_EngNature] (
    [CleNature]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodNature]     VARCHAR (50)  NOT NULL,
    [LibNature]     VARCHAR (100) NOT NULL,
    [TxtNature]     VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bud_EngNature] PRIMARY KEY CLUSTERED ([CleNature] ASC),
    CONSTRAINT [UN1_Bud_EngNature] UNIQUE NONCLUSTERED ([CodNature] ASC)
);

