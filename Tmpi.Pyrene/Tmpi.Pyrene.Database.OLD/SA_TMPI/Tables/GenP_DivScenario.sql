CREATE TABLE [SA_TMPI].[GenP_DivScenario] (
    [CleLogiciel]     TINYINT        NOT NULL,
    [CleScenario]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodScenario]     VARCHAR (50)   NOT NULL,
    [LibScenario]     VARCHAR (200)  NOT NULL,
    [TxtScenario]     VARCHAR (2000) NULL,
    [TypSerie]        TINYINT        CONSTRAINT [DF_GenP_DivScenario_TypSerie] DEFAULT ((0)) NULL,
    [CodProcedure]    VARCHAR (50)   NOT NULL,
    [EstActif]        BIT            CONSTRAINT [DF_GenP_DivScenario_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]     SMALLDATETIME  CONSTRAINT [DF_GenP_DivScenario_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT       CONSTRAINT [DF_GenP_DivScenario_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleModificateur] SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    CONSTRAINT [PK_GenP_DivScenario] PRIMARY KEY CLUSTERED ([CleScenario] ASC),
    CONSTRAINT [UN_GenP_DivScenario] UNIQUE NONCLUSTERED ([CodScenario] ASC)
);

