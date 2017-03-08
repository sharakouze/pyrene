CREATE TABLE [SA_TMPI].[Trn_PntMatrice] (
    [ClePoint]   INT      NOT NULL,
    [CleMatrice] SMALLINT NOT NULL,
    CONSTRAINT [PK_Trn_PntMatrice] PRIMARY KEY CLUSTERED ([CleMatrice] ASC, [ClePoint] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntMatrice]
    ON [SA_TMPI].[Trn_PntMatrice]([ClePoint] ASC);

