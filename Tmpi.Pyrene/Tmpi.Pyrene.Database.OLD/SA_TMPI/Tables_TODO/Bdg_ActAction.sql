CREATE TABLE [SA_TMPI].[Bdg_ActAction] (
    [CleAction]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleAction_C]   SMALLINT      NULL,
    [CleAction_H]   SMALLINT      NOT NULL,
    [CodAction]     VARCHAR (50)  NOT NULL,
    [LibAction]     VARCHAR (100) NOT NULL,
    [TxtAction]     VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_ActAction_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_ActAction_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleSecteur]    SMALLINT      NOT NULL,
    [CleService]    SMALLINT      NOT NULL,
    [CleFamille]    SMALLINT      NOT NULL,
    CONSTRAINT [PK_Bdg_Bdg_Action] PRIMARY KEY CLUSTERED ([CleAction] ASC),
    CONSTRAINT [FK1_Bdg_ActAction] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Bdg_Act_Famille] ([CleFamille]),
    CONSTRAINT [UN_Bdg_Bdg_Action] UNIQUE NONCLUSTERED ([CodAction] ASC)
);

