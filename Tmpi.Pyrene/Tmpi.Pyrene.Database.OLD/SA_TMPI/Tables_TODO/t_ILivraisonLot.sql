CREATE TABLE [SA_TMPI].[t_ILivraisonLot] (
    [CleILivraison]    INT             NOT NULL,
    [CleILivraisonLig] INT             NOT NULL,
    [CleArticle]       INT             NOT NULL,
    [QteArticle]       DECIMAL (15, 3) NOT NULL,
    [CleLot]           INT             NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_ILivraisonLot]
    ON [SA_TMPI].[t_ILivraisonLot]([CleILivraison] ASC) WITH (FILLFACTOR = 90);

