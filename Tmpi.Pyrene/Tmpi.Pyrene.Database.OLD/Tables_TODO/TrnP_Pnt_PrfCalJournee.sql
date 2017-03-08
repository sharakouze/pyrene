CREATE TABLE [SA_TMPI].[TrnP_Pnt_PrfCalJournee] (
    [CleProfil]       SMALLINT NOT NULL,
    [NumJournee]      TINYINT  NOT NULL,
    [HeuDebutJournee] SMALLINT NULL,
    [HeuFinJournee]   SMALLINT NULL,
    [HeuDebutPause]   SMALLINT NULL,
    [HeuFinPause]     SMALLINT NULL,
    CONSTRAINT [PK_TrnP_Pnt_PrfCalJournee] PRIMARY KEY CLUSTERED ([CleProfil] ASC, [NumJournee] ASC),
    CONSTRAINT [PK1_TrnP_Pnt_PrfCalJournee] FOREIGN KEY ([CleProfil]) REFERENCES [SA_TMPI].[TrnP_Pnt_PrfProfil] ([CleProfil])
);

