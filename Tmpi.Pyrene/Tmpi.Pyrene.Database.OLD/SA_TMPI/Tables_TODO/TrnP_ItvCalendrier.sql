CREATE TABLE [SA_TMPI].[TrnP_ItvCalendrier] (
    [CleItvCalendrier] INT           IDENTITY (1, 1) NOT NULL,
    [CleIntervenant]   SMALLINT      NULL,
    [CleCalendrier]    SMALLINT      NULL,
    [DatDebutPeriode]  SMALLDATETIME NULL,
    [DatFinPeriode]    SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_ItvCalendrier] PRIMARY KEY CLUSTERED ([CleItvCalendrier] ASC),
    CONSTRAINT [FK1_TrnP_ItvCalendrier] FOREIGN KEY ([CleIntervenant]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK2_TrnP_ItvCalendrier] FOREIGN KEY ([CleCalendrier]) REFERENCES [SA_TMPI].[TrnP_Itv_CalCalendrier] ([CleCalendrier])
);

