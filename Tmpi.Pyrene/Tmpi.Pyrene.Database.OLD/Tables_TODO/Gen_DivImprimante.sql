CREATE TABLE [SA_TMPI].[Gen_DivImprimante] (
    [CleImprimante] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodImprimante] VARCHAR (50)  NOT NULL,
    [NomImprimante] VARCHAR (100) NOT NULL,
    [TxtImprimante] VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_DivImprimante_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_DivImprimante_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    CONSTRAINT [PK_Gen_DivImprimante] PRIMARY KEY CLUSTERED ([CleImprimante] ASC),
    CONSTRAINT [UN_Gen_DivImprimante] UNIQUE NONCLUSTERED ([CodImprimante] ASC)
);

