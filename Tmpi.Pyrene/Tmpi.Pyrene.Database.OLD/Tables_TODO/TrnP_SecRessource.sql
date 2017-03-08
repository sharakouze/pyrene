CREATE TABLE [SA_TMPI].[TrnP_SecRessource] (
    [CleSecteur]     SMALLINT NOT NULL,
    [CleFamille]     SMALLINT NOT NULL,
    [CleEquipement]  INT      NULL,
    [CleConsommable] INT      NULL,
    [ClePersonne]    SMALLINT NULL,
    CONSTRAINT [FK2_TrnP_RscRessource] FOREIGN KEY ([CleEquipement]) REFERENCES [SA_TMPI].[t_Equip] ([CleEquip]),
    CONSTRAINT [FK3_TrnP_RscRessource] FOREIGN KEY ([CleConsommable]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle])
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_SecRessource]
    ON [SA_TMPI].[TrnP_SecRessource]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_TrnP_SecRessource]
    ON [SA_TMPI].[TrnP_SecRessource]([CleFamille] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_TrnP_SecRessource]
    ON [SA_TMPI].[TrnP_SecRessource]([CleEquipement] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_TrnP_SecRessource]
    ON [SA_TMPI].[TrnP_SecRessource]([CleConsommable] ASC);

