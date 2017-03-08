CREATE TABLE [SA_TMPI].[TrnP_PntCalendrier] (
    [CleItvCalendrier] INT           IDENTITY (1, 1) NOT NULL,
    [CleIntervenant]   SMALLINT      NULL,
    [CleCalendrier]    SMALLINT      NULL,
    [DatDebutPeriode]  SMALLDATETIME NULL,
    [DatFinPeriode]    SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_PntCalendrier] PRIMARY KEY CLUSTERED ([CleItvCalendrier] ASC),
    CONSTRAINT [FK1_TrnP_PntCalendrier] FOREIGN KEY ([CleIntervenant]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK2_TrnP_PntCalendrier] FOREIGN KEY ([CleCalendrier]) REFERENCES [SA_TMPI].[TrnP_Pnt_CalCalendrier] ([CleCalendrier])
);

