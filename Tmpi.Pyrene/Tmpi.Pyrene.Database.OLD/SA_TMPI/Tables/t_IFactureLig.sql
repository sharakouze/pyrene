CREATE TABLE [SA_TMPI].[t_IFactureLig] (
    [CleIFacture]   INT             NOT NULL,
    [QteArticle]    DECIMAL (15, 3) CONSTRAINT [DF_t_IFactureLig_QteArticle] DEFAULT ((0)) NOT NULL,
    [CleArticle]    INT             NULL,
    [CodArticle]    VARCHAR (50)    NULL,
    [LibArticle]    VARCHAR (100)   NOT NULL,
    [PrxUnitaire]   DECIMAL (15, 4) CONSTRAINT [DF_t_IFactureLig_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauTva]        DECIMAL (5, 2)  CONSTRAINT [DF_t_IFactureLig_TauTva] DEFAULT ((0)) NOT NULL,
    [CleDevise]     SMALLINT        NULL,
    [CleImput]      SMALLINT        NOT NULL,
    [CleILivraison] INT             NULL,
    CONSTRAINT [FK1_t_IFactureLig] FOREIGN KEY ([CleIFacture]) REFERENCES [SA_TMPI].[t_IFacture] ([CleIFacture])
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_IFactureLig]
    ON [SA_TMPI].[t_IFactureLig]([CleIFacture] ASC) WITH (FILLFACTOR = 90);

