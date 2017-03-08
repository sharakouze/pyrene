CREATE TABLE [SA_TMPI].[Sto_EcoMarche] (
    [CleBudget]   SMALLINT        NULL,
    [CleExercice] SMALLINT        NULL,
    [CleCommande] INT             NULL,
    [CleFacture]  INT             NULL,
    [CleMarche]   INT             NULL,
    [MntPrevu]    DECIMAL (15, 2) NULL,
    [MntFacture]  DECIMAL (15, 2) NULL,
    [MntRealise]  DECIMAL (15, 2) NULL,
    CONSTRAINT [FK1_Sto_EcoMarche] FOREIGN KEY ([CleCommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande]),
    CONSTRAINT [FK2_Sto_EcoMarche] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[t_EFacture] ([CleEFacture])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_EcoMarche]
    ON [SA_TMPI].[Sto_EcoMarche]([CleCommande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_EcoMarche]
    ON [SA_TMPI].[Sto_EcoMarche]([CleExercice] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Sto_EcoMarche]
    ON [SA_TMPI].[Sto_EcoMarche]([CleFacture] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Sto_EcoMarche]
    ON [SA_TMPI].[Sto_EcoMarche]([CleMarche] ASC);

