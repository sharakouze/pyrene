CREATE TABLE [SA_TMPI].[Trn_PlnJournee] (
    [ClePlanning]   INT           NOT NULL,
    [DatJournee]    SMALLDATETIME NOT NULL,
    [NumJour_M]     TINYINT       NOT NULL,
    [NumJour_S]     TINYINT       NOT NULL,
    [EstExclus]     BIT           NOT NULL,
    [CleSecteur]    SMALLINT      NOT NULL,
    [TxtJournee]    VARCHAR (255) NULL,
    [ClePlnJournee] INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Trn_PlnJournee] PRIMARY KEY CLUSTERED ([CleSecteur] ASC, [DatJournee] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PlnJournee]
    ON [SA_TMPI].[Trn_PlnJournee]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_PlnJournee]
    ON [SA_TMPI].[Trn_PlnJournee]([NumJour_S] ASC);

