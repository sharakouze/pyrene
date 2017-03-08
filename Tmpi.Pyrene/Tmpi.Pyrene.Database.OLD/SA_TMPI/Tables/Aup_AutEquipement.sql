CREATE TABLE [SA_TMPI].[Aup_AutEquipement] (
    [CleAutomate]   SMALLINT NOT NULL,
    [CleEquipement] INT      NOT NULL,
    CONSTRAINT [PK_Aup_AutEquipement] PRIMARY KEY CLUSTERED ([CleAutomate] ASC, [CleEquipement] ASC)
);

