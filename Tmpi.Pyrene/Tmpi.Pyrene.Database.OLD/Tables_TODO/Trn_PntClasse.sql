CREATE TABLE [SA_TMPI].[Trn_PntClasse] (
    [ClePoint]  INT      NOT NULL,
    [CleClasse] SMALLINT NOT NULL,
    CONSTRAINT [PK_Trn_PntClasse] PRIMARY KEY CLUSTERED ([CleClasse] ASC, [ClePoint] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntClasse]
    ON [SA_TMPI].[Trn_PntClasse]([ClePoint] ASC);

