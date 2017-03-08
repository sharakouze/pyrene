CREATE TABLE [SA_TMPI].[StoP_MagClient] (
    [CleMagasin]  SMALLINT NOT NULL,
    [CleSociete]  SMALLINT NULL,
    [CleSecteur]  SMALLINT NULL,
    [CleService]  SMALLINT NULL,
    [ClePersonne] SMALLINT NULL,
    CONSTRAINT [FK1_StoP_MagClient] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_StoP_MagClient] FOREIGN KEY ([CleSociete]) REFERENCES [SA_TMPI].[Gen_SocSociete] ([CleSociete]),
    CONSTRAINT [FK3_StoP_MagClient] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK4_StoP_MagClient] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK5_StoP_MagClient] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [UN_StoP_MagClient] UNIQUE NONCLUSTERED ([CleMagasin] ASC, [CleSociete] ASC, [CleSecteur] ASC, [CleService] ASC, [ClePersonne] ASC)
);

