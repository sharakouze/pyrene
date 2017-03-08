CREATE TABLE [SA_TMPI].[Trn_PntRessource] (
    [ClePoint]      INT      NOT NULL,
    [CleFamille]    SMALLINT NOT NULL,
    [CleEquipement] INT      NULL,
    CONSTRAINT [PK_Trn_PntRessource] PRIMARY KEY CLUSTERED ([ClePoint] ASC, [CleFamille] ASC),
    CONSTRAINT [FK1_Trn_PntRessource] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint]),
    CONSTRAINT [FK2_Trn_PntRessource] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[TrnP_Rsc_Famille] ([CleFamille])
);

