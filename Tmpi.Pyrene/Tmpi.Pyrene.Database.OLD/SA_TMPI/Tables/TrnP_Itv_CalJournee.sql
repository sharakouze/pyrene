CREATE TABLE [SA_TMPI].[TrnP_Itv_CalJournee] (
    [CleCalendrier]   SMALLINT NOT NULL,
    [NumJournee]      TINYINT  NOT NULL,
    [HeuDebutJournee] SMALLINT NULL,
    [HeuFinJournee]   SMALLINT NULL,
    [DurPause]        SMALLINT NULL,
    [HeuDebutPause]   SMALLINT NULL,
    [HeuFinPause]     SMALLINT NULL,
    [DurTravail]      SMALLINT NULL,
    CONSTRAINT [PK_TrnP_Itv_CalJournee] PRIMARY KEY CLUSTERED ([CleCalendrier] ASC, [NumJournee] ASC),
    CONSTRAINT [PK1_TrnP_Itv_CalJournee] FOREIGN KEY ([CleCalendrier]) REFERENCES [SA_TMPI].[TrnP_Itv_CalCalendrier] ([CleCalendrier])
);

