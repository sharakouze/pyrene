CREATE TABLE [SA_TMPI].[Bdg_ActRubrique] (
    [CleAction]     SMALLINT      NOT NULL,
    [CleRubrique]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodRubrique]   VARCHAR (50)  NOT NULL,
    [LibRubrique]   VARCHAR (100) NOT NULL,
    [TxtRubrique]   VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_ActRubrique_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_ActRubrique_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_ActRubrique] PRIMARY KEY CLUSTERED ([CleRubrique] ASC),
    CONSTRAINT [FK1_Bdg_ActRubrique] FOREIGN KEY ([CleAction]) REFERENCES [SA_TMPI].[Bdg_ActAction] ([CleAction]),
    CONSTRAINT [UN_Bdg_ActRubrique] UNIQUE NONCLUSTERED ([CleAction] ASC, [CodRubrique] ASC)
);

