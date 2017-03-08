CREATE TABLE [SA_TMPI].[Trn_TchContrainte] (
    [CleTache]             INT           NOT NULL,
    [NumRegroupement]      VARCHAR (25)  NULL,
    [DatIntervention]      SMALLDATETIME NULL,
    [CleIntervenant]       SMALLINT      NULL,
    [CleTacheRegroupement] INT           NULL,
    [EstTacheRegroupement] BIT           CONSTRAINT [DF_EstTacheRegroupement_Trn_TchContrainte] DEFAULT ((0)) NOT NULL,
    [DurTacheRegroupement] SMALLINT      NULL,
    CONSTRAINT [PK_Trn_TchContrainte] PRIMARY KEY CLUSTERED ([CleTache] ASC),
    CONSTRAINT [FK1_Trn_TchContrainte] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_DemTache] ([CleDemTache])
);

