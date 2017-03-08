CREATE TABLE [SA_TMPI].[Trn_DemProduit] (
    [CleDemande] INT     NOT NULL,
    [CleProduit] INT     NOT NULL,
    [NumOrdre]   TINYINT NULL,
    [CleStyle]   INT     NULL,
    CONSTRAINT [PK_Trn_DemProduit] PRIMARY KEY CLUSTERED ([CleDemande] ASC, [CleProduit] ASC),
    CONSTRAINT [FK1_Trn_DemProduit] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Trn_DemDemande] ([CleDemande])
);

