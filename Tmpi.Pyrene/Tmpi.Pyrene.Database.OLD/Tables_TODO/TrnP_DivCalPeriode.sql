CREATE TABLE [SA_TMPI].[TrnP_DivCalPeriode] (
    [CleCalendrier]      SMALLINT       NOT NULL,
    [CleCalPeriode]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [DatDebutPeriode]    SMALLDATETIME  NULL,
    [DatFinPeriode]      SMALLDATETIME  NULL,
    [CleIndisponibilite] SMALLINT       NOT NULL,
    [TxtPeriode]         VARCHAR (4000) NULL,
    CONSTRAINT [PK_TrnP_DivCalPeriode] PRIMARY KEY CLUSTERED ([CleCalPeriode] ASC),
    CONSTRAINT [FK1_TrnP_DivCalPeriode] FOREIGN KEY ([CleCalendrier]) REFERENCES [SA_TMPI].[TrnP_DivCalCalendrier] ([CleCalendrier])
);

