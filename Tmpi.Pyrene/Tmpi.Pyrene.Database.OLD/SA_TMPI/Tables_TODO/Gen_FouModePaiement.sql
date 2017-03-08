CREATE TABLE [SA_TMPI].[Gen_FouModePaiement] (
    [CleModePaiement]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleModePaiement_C] SMALLINT      NULL,
    [CleModePaiement_H] SMALLINT      NOT NULL,
    [CodModePaiement]   VARCHAR (50)  NOT NULL,
    [LibModePaiement]   VARCHAR (100) NOT NULL,
    [TxtModePaiement]   VARCHAR (255) NULL,
    [EstActif]          BIT           CONSTRAINT [DF_Gen_FouModePaiement_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_Gen_FouModePaiement_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT      NOT NULL,
    [DatModif]          SMALLDATETIME NULL,
    [CleOperateur]      SMALLINT      NULL,
    [DatValidation]     SMALLDATETIME NULL,
    [CleValideur]       SMALLINT      NULL,
    CONSTRAINT [PK_Gen_FouModePaiement] PRIMARY KEY CLUSTERED ([CleModePaiement] ASC),
    CONSTRAINT [UN1_Gen_FouModePaiement] UNIQUE NONCLUSTERED ([CodModePaiement] ASC, [CleModePaiement_H] ASC)
);

