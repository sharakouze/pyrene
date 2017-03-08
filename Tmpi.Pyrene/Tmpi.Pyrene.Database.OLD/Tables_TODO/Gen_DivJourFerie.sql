CREATE TABLE [SA_TMPI].[Gen_DivJourFerie] (
    [CleJourFerie]  SMALLINT      IDENTITY (1, 1) NOT NULL,
    [DatJourFerie]  SMALLDATETIME NOT NULL,
    [LibJourFerie]  VARCHAR (100) NOT NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_DivJourFerie_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_DivJourFerie_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gen_DivJourFerie] PRIMARY KEY CLUSTERED ([CleJourFerie] ASC),
    CONSTRAINT [UN_Gen_DivJourFerie] UNIQUE NONCLUSTERED ([DatJourFerie] ASC)
);

