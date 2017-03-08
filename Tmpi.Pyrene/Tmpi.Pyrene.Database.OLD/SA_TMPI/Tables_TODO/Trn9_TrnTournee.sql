CREATE TABLE [SA_TMPI].[Trn9_TrnTournee] (
    [CleSecteur]    SMALLINT       NOT NULL,
    [CleTournee]    INT            NOT NULL,
    [DatTournee]    SMALLDATETIME  NOT NULL,
    [TxtTournee]    VARCHAR (1000) NULL,
    [ClePreleveur]  SMALLINT       NOT NULL,
    [DatPrevue]     SMALLDATETIME  NOT NULL,
    [NbrKilometre]  SMALLINT       NOT NULL,
    [DurTournee]    SMALLINT       NOT NULL,
    [PrxUnitaire_K] DECIMAL (5, 2) NOT NULL,
    [PrxUnitaire_H] DECIMAL (5, 2) NOT NULL,
    [PrxUnitaire_T] DECIMAL (5, 2) NOT NULL,
    CONSTRAINT [PK_Trn9_TrnTournee] PRIMARY KEY CLUSTERED ([CleTournee] ASC),
    CONSTRAINT [FK1_Trn9_TrnTournee] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn9_TrnTournee]
    ON [SA_TMPI].[Trn9_TrnTournee]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn9_TrnTournee]
    ON [SA_TMPI].[Trn9_TrnTournee]([ClePreleveur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Trn9_TrnTournee]
    ON [SA_TMPI].[Trn9_TrnTournee]([DatTournee] ASC);

