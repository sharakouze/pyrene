CREATE TABLE [SA_TMPI].[Sto_EcoNomenclature] (
    [CleBudget]       SMALLINT        NULL,
    [CleExercice]     SMALLINT        NULL,
    [CleCommande]     INT             NULL,
    [CleFacture]      INT             NULL,
    [CleNomenclature] SMALLINT        NULL,
    [MntPrevu]        DECIMAL (15, 2) NULL,
    [MntFacture]      DECIMAL (15, 2) NULL,
    [MntRealise]      DECIMAL (15, 2) NULL,
    CONSTRAINT [FK1_Sto_EcoNomenclature] FOREIGN KEY ([CleCommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande]),
    CONSTRAINT [FK2_Sto_EcoNomenclature] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[t_EFacture] ([CleEFacture])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_EcoNomenclature]
    ON [SA_TMPI].[Sto_EcoNomenclature]([CleBudget] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_EcoNomenclature]
    ON [SA_TMPI].[Sto_EcoNomenclature]([CleCommande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Sto_EcoNomenclature]
    ON [SA_TMPI].[Sto_EcoNomenclature]([CleFacture] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Sto_EcoNomenclature]
    ON [SA_TMPI].[Sto_EcoNomenclature]([CleNomenclature] ASC);

