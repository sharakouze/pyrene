CREATE TABLE [SA_TMPI].[TrnP_Pnt_CalJournee] (
    [CleCalendrier]   SMALLINT NOT NULL,
    [NumJournee]      TINYINT  NOT NULL,
    [HeuDebutJournee] SMALLINT NULL,
    [HeuFinJournee]   SMALLINT NULL,
    [HeuDebutPause]   SMALLINT NULL,
    [HeuFinPause]     SMALLINT NULL,
    CONSTRAINT [PK_TrnP_Pnt_CalJournee] PRIMARY KEY CLUSTERED ([CleCalendrier] ASC, [NumJournee] ASC),
    CONSTRAINT [PK1_TrnP_Pnt_CalJournee] FOREIGN KEY ([CleCalendrier]) REFERENCES [SA_TMPI].[TrnP_Pnt_CalCalendrier] ([CleCalendrier])
);

