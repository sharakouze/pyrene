CREATE TABLE [SA_TMPI].[Gen_FouModeReglement] (
    [CleModeReglement]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleModeReglement_C] SMALLINT      NULL,
    [CleModeReglement_H] SMALLINT      NOT NULL,
    [CodModeReglement]   VARCHAR (50)  NOT NULL,
    [LibModeReglement]   VARCHAR (100) NOT NULL,
    [TxtModeReglement]   VARCHAR (255) NULL,
    [EstActif]           BIT           CONSTRAINT [DF_Gen_FouModeReglement_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME CONSTRAINT [DF_Gen_FouModeReglement_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT      NOT NULL,
    [DatModif]           SMALLDATETIME NULL,
    [CleOperateur]       SMALLINT      NULL,
    [DatValidation]      SMALLDATETIME NULL,
    [CleValideur]        SMALLINT      NULL,
    CONSTRAINT [PK_Gen_FouModeReglement] PRIMARY KEY CLUSTERED ([CleModeReglement] ASC),
    CONSTRAINT [UN1_Gen_FouModeReglement] UNIQUE NONCLUSTERED ([CodModeReglement] ASC, [CleModeReglement_H] ASC)
);

