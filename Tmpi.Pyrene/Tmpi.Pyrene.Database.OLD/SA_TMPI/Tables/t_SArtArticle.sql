CREATE TABLE [SA_TMPI].[t_SArtArticle] (
    [ClePerso]        SMALLINT        NOT NULL,
    [CleArticle]      INT             NOT NULL,
    [QteArticle]      DECIMAL (15, 3) NOT NULL,
    [CleMagasin]      TINYINT         NULL,
    [CleArticleTarif] INT             NULL,
    CONSTRAINT [FK1_t_SArtArticle] FOREIGN KEY ([ClePerso]) REFERENCES [SA_TMPI].[t_SArt] ([ClePerso])
);

