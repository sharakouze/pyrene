CREATE TABLE [SA_TMPI].[TrnP_SecEquipement] (
    [CleSecteur]    SMALLINT NOT NULL,
    [CleEquipement] INT      NOT NULL,
    CONSTRAINT [PK_TrnP_SecEquipement] PRIMARY KEY CLUSTERED ([CleSecteur] ASC, [CleEquipement] ASC),
    CONSTRAINT [FK1_TrnP_SecEquipement] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_TrnP_SecEquipement] FOREIGN KEY ([CleEquipement]) REFERENCES [SA_TMPI].[TrnP_RscEquipement] ([CleEquipement])
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_SecEquipement]
    ON [SA_TMPI].[TrnP_SecEquipement]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_TrnP_SecEquipement]
    ON [SA_TMPI].[TrnP_SecEquipement]([CleEquipement] ASC);

