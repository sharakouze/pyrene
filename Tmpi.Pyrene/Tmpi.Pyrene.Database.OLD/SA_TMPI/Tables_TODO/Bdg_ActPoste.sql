CREATE TABLE [SA_TMPI].[Bdg_ActPoste] (
    [CleAction]     SMALLINT      NOT NULL,
    [CleRubrique]   SMALLINT      NOT NULL,
    [ClePoste]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodPoste]      VARCHAR (50)  NOT NULL,
    [LibPoste]      VARCHAR (100) NOT NULL,
    [TxtPoste]      VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_ActPoste_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_ActPoste_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_ActPoste] PRIMARY KEY CLUSTERED ([ClePoste] ASC),
    CONSTRAINT [FK1_Bdg_ActPoste] FOREIGN KEY ([CleAction]) REFERENCES [SA_TMPI].[Bdg_ActAction] ([CleAction]),
    CONSTRAINT [FK2_Bdg_ActPoste] FOREIGN KEY ([CleRubrique]) REFERENCES [SA_TMPI].[Bdg_ActRubrique] ([CleRubrique]),
    CONSTRAINT [UN_Bdg_ActPoste] UNIQUE NONCLUSTERED ([CleRubrique] ASC, [CodPoste] ASC)
);

