CREATE TABLE [SA_TMPI].[Sto_EcoEngagement] (
    [CleBudget]       SMALLINT        NULL,
    [CleExercice]     SMALLINT        NULL,
    [CleCommande]     INT             NULL,
    [CleFacture]      INT             NULL,
    [CleEngagement]   INT             NULL,
    [CleEngLigne]     INT             NULL,
    [CleImputation]   INT             NULL,
    [CleNomenclature] INT             NULL,
    [TauTVA]          DECIMAL (5, 2)  NULL,
    [MntPrevu]        DECIMAL (10, 2) NULL,
    [MntRealise]      DECIMAL (10, 2) NULL,
    [MntFacture]      DECIMAL (10, 2) NULL,
    [TauRecup]        DECIMAL (5, 2)  NULL,
    CONSTRAINT [FK1_Sto_EcoEngagement] FOREIGN KEY ([CleCommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande]),
    CONSTRAINT [FK2_Sto_EcoEngagement] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[t_EFacture] ([CleEFacture])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_EcoEngagement]
    ON [SA_TMPI].[Sto_EcoEngagement]([CleBudget] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_EcoEngagement]
    ON [SA_TMPI].[Sto_EcoEngagement]([CleCommande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Sto_EcoEngagement]
    ON [SA_TMPI].[Sto_EcoEngagement]([CleFacture] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Sto_EcoEngagement]
    ON [SA_TMPI].[Sto_EcoEngagement]([CleEngagement] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Sto_EcoEngagement]
    ON [SA_TMPI].[Sto_EcoEngagement]([CleEngLigne] ASC);

