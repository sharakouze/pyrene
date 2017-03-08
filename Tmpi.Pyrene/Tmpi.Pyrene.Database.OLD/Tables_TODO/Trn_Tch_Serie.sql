CREATE TABLE [SA_TMPI].[Trn_Tch_Serie] (
    [CleScenario]        SMALLINT      NOT NULL,
    [CleSerie]           INT           IDENTITY (1, 1) NOT NULL,
    [LibSerie]           VARCHAR (200) NOT NULL,
    [DatDebut]           SMALLDATETIME NULL,
    [DatFin]             SMALLDATETIME NULL,
    [CleTchReference]    INT           NULL,
    [CleTchRegroupement] INT           NULL,
    [CleIntervenant]     SMALLINT      NULL,
    [DatIntervention]    SMALLDATETIME NULL,
    [DelTache]           TINYINT       NULL,
    [CleValideur]        SMALLINT      NULL,
    [DatValidation]      SMALLDATETIME NULL,
    [EstASuspendre]      BIT           CONSTRAINT [DF_Trn_Tch_Serie_EstASuspendre] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Trn_Tch_Serie] PRIMARY KEY CLUSTERED ([CleSerie] ASC),
    CONSTRAINT [FK1_Trn_Tch_Serie] FOREIGN KEY ([CleScenario]) REFERENCES [SA_TMPI].[TrnP_Tch_Scenario] ([CleScenario])
);

