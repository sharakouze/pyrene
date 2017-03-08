CREATE TABLE [SA_TMPI].[Trn_PntProduit] (
    [ClePoint]   INT      NOT NULL,
    [CleProduit] SMALLINT NOT NULL,
    CONSTRAINT [PK_Trn_PntProduit] PRIMARY KEY CLUSTERED ([ClePoint] ASC, [CleProduit] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntProduit]
    ON [SA_TMPI].[Trn_PntProduit]([ClePoint] ASC);

