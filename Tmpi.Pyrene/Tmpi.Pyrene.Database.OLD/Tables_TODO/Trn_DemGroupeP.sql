CREATE TABLE [SA_TMPI].[Trn_DemGroupeP] (
    [CleDemande]   INT      NULL,
    [CleDemTache]  INT      NULL,
    [CleGroupeP]   SMALLINT NOT NULL,
    [EstReference] BIT      CONSTRAINT [DF_Trn_DemGroupeP_EstReference] DEFAULT ((0)) NOT NULL,
    [TypMouvement] TINYINT  CONSTRAINT [DF_Trn_DemGroupeP_TypMouvement] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FK1_Trn_DemGroupeP] FOREIGN KEY ([CleDemTache]) REFERENCES [SA_TMPI].[Trn_DemTache] ([CleDemTache]),
    CONSTRAINT [UN_Trn_DemGroupeP] UNIQUE NONCLUSTERED ([CleDemande] ASC, [CleDemTache] ASC, [CleGroupeP] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemGroupeP]
    ON [SA_TMPI].[Trn_DemGroupeP]([CleDemande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_DemGroupeP]
    ON [SA_TMPI].[Trn_DemGroupeP]([CleDemTache] ASC);

