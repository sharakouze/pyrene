CREATE TABLE [SA_TMPI].[Gen_FouCritereQ] (
    [CleCritereQ]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodCritereQ]   VARCHAR (50)  NOT NULL,
    [LibCritereQ]   VARCHAR (100) NOT NULL,
    [TxtCritereQ]   VARCHAR (255) NULL,
    [ValCoef]       TINYINT       CONSTRAINT [DF_Gen_FouCritereQ_ValCoef] DEFAULT ((0)) NOT NULL,
    [TypEvenement]  TINYINT       CONSTRAINT [DF_Gen_FouCritereQ_TypEvenement] DEFAULT ((0)) NOT NULL,
    [TypObjet]      TINYINT       CONSTRAINT [DF_Gen_FouCritereQ_TypObjet] DEFAULT ((0)) NOT NULL,
    [ValNoteDef]    TINYINT       CONSTRAINT [DF_Gen_FouCritereQ_ValNoteDef] DEFAULT ((2)) NOT NULL,
    [DatModif]      DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gen_FouCritereQ] PRIMARY KEY CLUSTERED ([CleCritereQ] ASC),
    CONSTRAINT [UN_Gen_FouCritereQ] UNIQUE NONCLUSTERED ([CodCritereQ] ASC)
);

