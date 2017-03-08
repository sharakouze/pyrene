CREATE TABLE [SA_TMPI].[TrnP_RscEquipement] (
    [CleFamille]    SMALLINT NOT NULL,
    [CleEquipement] INT      NOT NULL,
    [EstPartage]    BIT      CONSTRAINT [DF_TrnP_RscEquipement_EstPartage] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TrnP_RscEquipement] PRIMARY KEY CLUSTERED ([CleEquipement] ASC),
    CONSTRAINT [FK1_TrnP_RscEquipement] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[TrnP_Rsc_Famille] ([CleFamille]),
    CONSTRAINT [FK2_TrnP_RscEquipement] FOREIGN KEY ([CleEquipement]) REFERENCES [SA_TMPI].[t_Equip] ([CleEquip])
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_RscEquipement]
    ON [SA_TMPI].[TrnP_RscEquipement]([CleFamille] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_TrnP_RscEquipement]
    ON [SA_TMPI].[TrnP_RscEquipement]([CleEquipement] ASC);

