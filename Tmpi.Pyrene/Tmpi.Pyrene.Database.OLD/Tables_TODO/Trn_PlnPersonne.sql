CREATE TABLE [SA_TMPI].[Trn_PlnPersonne] (
    [ClePlnPersonne] INT            IDENTITY (1, 1) NOT NULL,
    [CleTournee]     INT            NULL,
    [CleFamille]     SMALLINT       NOT NULL,
    [ClePersonne]    SMALLINT       NULL,
    [DatDebut]       SMALLDATETIME  NOT NULL,
    [DatFin]         SMALLDATETIME  NOT NULL,
    [TxtReservation] VARCHAR (1000) NULL,
    [EstIgnore]      BIT            CONSTRAINT [DF_Trn_PlnPersonne_EstIgnore] DEFAULT ((0)) NOT NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_Trn_PlnPersonne] PRIMARY KEY CLUSTERED ([ClePlnPersonne] ASC),
    CONSTRAINT [FK1_Trn_PlnPersonne] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK2_Trn_PlnPersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PlnPersonne]
    ON [SA_TMPI].[Trn_PlnPersonne]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_PlnPersonne]
    ON [SA_TMPI].[Trn_PlnPersonne]([ClePersonne] ASC);

