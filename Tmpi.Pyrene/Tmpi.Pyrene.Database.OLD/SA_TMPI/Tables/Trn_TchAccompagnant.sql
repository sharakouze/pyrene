CREATE TABLE [SA_TMPI].[Trn_TchAccompagnant] (
    [CleAccompagnant] INT      IDENTITY (1, 1) NOT NULL,
    [CleTache]        INT      NOT NULL,
    [ClePreleveur]    SMALLINT NULL,
    [CleContrainte]   SMALLINT NULL,
    CONSTRAINT [PK_Trn_TchAccompagnant] PRIMARY KEY CLUSTERED ([CleAccompagnant] ASC),
    CONSTRAINT [FK_Trn_TchAccompagnant_CleContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [FK_Trn_TchAccompagnant_ClePreleveur] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK_Trn_TchAccompagnant_CleTache] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache])
);

