CREATE TABLE [SA_TMPI].[Trn9_TrnTache] (
    [CleDemande]      INT            NULL,
    [CleGestionnaire] INT            NULL,
    [ClePrescripteur] INT            NULL,
    [CleTournee]      INT            NOT NULL,
    [CleTache]        INT            NOT NULL,
    [TxtTache]        VARCHAR (2000) NULL,
    [ClePoint]        INT            NOT NULL,
    [NbrEchantillon]  TINYINT        NOT NULL,
    [DatPrevue]       SMALLDATETIME  NULL,
    [NumOrdre]        SMALLINT       NULL,
    [DatRealisation]  SMALLDATETIME  NULL,
    [HeuRealisation]  SMALLINT       NULL,
    CONSTRAINT [PK_Trn9_TrnTache] PRIMARY KEY CLUSTERED ([CleTache] ASC),
    CONSTRAINT [FK1_Trn9_TrnTache] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn9_TrnTournee] ([CleTournee])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn9_TrnTache]
    ON [SA_TMPI].[Trn9_TrnTache]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn9_TrnTache]
    ON [SA_TMPI].[Trn9_TrnTache]([ClePoint] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Trn9_TrnTache]
    ON [SA_TMPI].[Trn9_TrnTache]([CleGestionnaire] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Trn9_TrnTache]
    ON [SA_TMPI].[Trn9_TrnTache]([ClePrescripteur] ASC);

