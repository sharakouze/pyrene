CREATE TABLE [SA_TMPI].[t_EquipPiece] (
    [CleEquip]       INT      NOT NULL,
    [CleEquipPlanif] INT      NULL,
    [ClePiece]       INT      NOT NULL,
    [QtePiece]       SMALLINT CONSTRAINT [DF_t_EquipPiece_QtePiece] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FK1_t_EquipPiece] FOREIGN KEY ([ClePiece]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_t_EquipPiece] FOREIGN KEY ([CleEquip]) REFERENCES [SA_TMPI].[t_Equip] ([CleEquip])
);


GO
CREATE NONCLUSTERED INDEX [ID1_EquipPiece]
    ON [SA_TMPI].[t_EquipPiece]([CleEquip] ASC) WITH (FILLFACTOR = 90);

