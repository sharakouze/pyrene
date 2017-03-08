CREATE TABLE [SA_TMPI].[TrnP_PntCalJournee] (
    [ClePoint]        INT      NOT NULL,
    [NumJournee]      TINYINT  NOT NULL,
    [HeuDebutJournee] SMALLINT NULL,
    [HeuFinJournee]   SMALLINT NULL,
    [HeuDebutPause]   SMALLINT NULL,
    [HeuFinPause]     SMALLINT NULL,
    CONSTRAINT [PK_TrnP_PntCalJournee] PRIMARY KEY CLUSTERED ([ClePoint] ASC, [NumJournee] ASC)
);

