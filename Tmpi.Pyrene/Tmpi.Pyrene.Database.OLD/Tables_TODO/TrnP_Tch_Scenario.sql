CREATE TABLE [SA_TMPI].[TrnP_Tch_Scenario] (
    [CleScenario]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodScenario]     VARCHAR (50)   NOT NULL,
    [LibScenario]     VARCHAR (200)  NOT NULL,
    [TxtScenario]     VARCHAR (2000) NULL,
    [CodProcedure]    VARCHAR (50)   NOT NULL,
    [EstActif]        BIT            CONSTRAINT [DF_TrnP_Tch_Scenario_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]     SMALLDATETIME  CONSTRAINT [DF_TrnP_Tch_Scenario_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT       CONSTRAINT [DF_TrnP_Tch_Scenario_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleModificateur] SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    [TypSerie]        TINYINT        CONSTRAINT [DF_TrnP_Tch_Scenario_TypSerie] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TrnP_Tch_Scenario] PRIMARY KEY CLUSTERED ([CleScenario] ASC),
    CONSTRAINT [UN_TrnP_Tch_Scenario] UNIQUE NONCLUSTERED ([CodScenario] ASC)
);

