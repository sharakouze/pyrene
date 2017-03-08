CREATE TABLE [SA_TMPI].[t_ArticleService] (
    [CleArticle] INT      NOT NULL,
    [CleService] SMALLINT NOT NULL,
    CONSTRAINT [PK_t_ArticleService] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [CleService] ASC),
    CONSTRAINT [FK1_t_ArticleService] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_t_ArticleService] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService])
);

