CREATE TABLE [SA_TMPI].[EdiP_ExpExport] (
    [CleExport]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodExport]     VARCHAR (50)  NOT NULL,
    [LibExport]     VARCHAR (100) NOT NULL,
    [TxtExport]     VARCHAR (255) NULL,
    [TypExport]     TINYINT       NOT NULL,
    [EstActif]      BIT           CONSTRAINT [DF_EdiP_ExpExport_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [EstImport]     BIT           CONSTRAINT [DF_EdiP_ExpExport_EstImport] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EdiP_ExpExport] PRIMARY KEY CLUSTERED ([CleExport] ASC),
    CONSTRAINT [UN_EdiP_ExpExport] UNIQUE NONCLUSTERED ([CodExport] ASC)
);

