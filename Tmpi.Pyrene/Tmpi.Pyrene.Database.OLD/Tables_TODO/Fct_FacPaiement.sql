CREATE TABLE [SA_TMPI].[Fct_FacPaiement] (
    [CleFacture]  INT             NOT NULL,
    [ClePaiement] INT             NOT NULL,
    [MntPaiement] DECIMAL (15, 2) NULL,
    CONSTRAINT [PK1_Fct_FacPaiement] PRIMARY KEY CLUSTERED ([CleFacture] ASC, [ClePaiement] ASC),
    CONSTRAINT [FK1_Fct_FacPaiement] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[Fct_FacFacture] ([CleFacture]),
    CONSTRAINT [FK2_Fct_FacPaiement] FOREIGN KEY ([ClePaiement]) REFERENCES [SA_TMPI].[Fct_PaiPaiement] ([ClePaiement])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Fct_FacPaiement]
    ON [SA_TMPI].[Fct_FacPaiement]([CleFacture] ASC);

