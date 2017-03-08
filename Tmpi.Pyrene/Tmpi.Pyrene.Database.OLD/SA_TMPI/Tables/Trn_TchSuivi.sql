CREATE TABLE [SA_TMPI].[Trn_TchSuivi] (
    [CleTache]         INT           NOT NULL,
    [DatPrevue]        SMALLDATETIME NULL,
    [HeuPrevue]        SMALLINT      NULL,
    [ClePreleveur]     SMALLINT      NULL,
    [SttTache]         TINYINT       NULL,
    [DatActualisation] SMALLDATETIME NULL,
    [TypOrigine]       TINYINT       NULL,
    CONSTRAINT [FK_Trn_TchSuivi_ClePreleveur] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK_Trn_TchSuivi_CleTache] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache])
);


GO
CREATE NONCLUSTERED INDEX [IX_Trn_TchSuivi_CleTache]
    ON [SA_TMPI].[Trn_TchSuivi]([CleTache] ASC);

