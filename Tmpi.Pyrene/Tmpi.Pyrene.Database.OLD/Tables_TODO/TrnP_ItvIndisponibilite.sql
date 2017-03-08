CREATE TABLE [SA_TMPI].[TrnP_ItvIndisponibilite] (
    [CleItvIndisponibilite] INT           IDENTITY (1, 1) NOT NULL,
    [CleIntervenant]        SMALLINT      NULL,
    [CleIndisponibilite]    SMALLINT      NULL,
    [DatDebutPeriode]       SMALLDATETIME NULL,
    [DatFinPeriode]         SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_ItvIndisponibilite] PRIMARY KEY CLUSTERED ([CleItvIndisponibilite] ASC),
    CONSTRAINT [FK1_TrnP_ItvIndisponibilite] FOREIGN KEY ([CleIntervenant]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK2_TrnP_ItvIndisponibilite] FOREIGN KEY ([CleIndisponibilite]) REFERENCES [SA_TMPI].[TrnP_DivIndisponibilite] ([CleIndisponibilite])
);

