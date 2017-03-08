CREATE TABLE [SA_TMPI].[t_AppelArticle] (
    [CleAppel]   SMALLINT        NOT NULL,
    [CleArticle] INT             NOT NULL,
    [CleMagasin] SMALLINT        NULL,
    [QteArticle] DECIMAL (15, 3) NOT NULL,
    CONSTRAINT [FK1_t_AppelArticle] FOREIGN KEY ([CleAppel]) REFERENCES [SA_TMPI].[t_Appel] ([CleAppel]),
    CONSTRAINT [FK2_t_AppelArticle] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK3_t_AppelArticle] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [UN_t_AppelArticle] UNIQUE NONCLUSTERED ([CleAppel] ASC, [CleArticle] ASC, [CleMagasin] ASC)
);

