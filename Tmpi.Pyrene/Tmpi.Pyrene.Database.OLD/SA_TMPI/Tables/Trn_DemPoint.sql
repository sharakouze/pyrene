CREATE TABLE [SA_TMPI].[Trn_DemPoint] (
    [CleDemande]      INT NOT NULL,
    [ClePoint]        INT NOT NULL,
    [CleGestionnaire] INT NULL,
    CONSTRAINT [PK_Trn_DemPoint] PRIMARY KEY CLUSTERED ([CleDemande] ASC, [ClePoint] ASC),
    CONSTRAINT [FK1_Trn_DemPoint] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Trn_DemDemande] ([CleDemande])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemPoint]
    ON [SA_TMPI].[Trn_DemPoint]([CleDemande] ASC);

