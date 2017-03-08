CREATE TABLE [SA_TMPI].[t_IFamille] (
    [CleIFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFamille]     VARCHAR (50)  NOT NULL,
    [LibFamille]     VARCHAR (100) NOT NULL,
    [TxtFamille]     VARCHAR (255) NULL,
    [IndPlanifiable] BIT           CONSTRAINT [DF_t_IFamille_IndPlanifiable] DEFAULT ((0)) NOT NULL,
    [TypEvenement]   TINYINT       NULL,
    [DatSaisie]      DATETIME      NULL,
    [CleOperateur]   SMALLINT      NULL,
    [NbrModif]       TINYINT       NULL,
    [NumVersion]     TINYINT       NULL,
    [DatValidation]  DATETIME      NULL,
    [CleValideur]    SMALLINT      NULL,
    CONSTRAINT [PK_IFamille] PRIMARY KEY CLUSTERED ([CleIFamille] ASC),
    CONSTRAINT [UN_IFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

