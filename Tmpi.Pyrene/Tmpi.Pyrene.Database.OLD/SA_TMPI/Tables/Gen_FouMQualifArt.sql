CREATE TABLE [SA_TMPI].[Gen_FouMQualifArt] (
    [CleCritereQ] SMALLINT NOT NULL,
    [CleArticle]  INT      NOT NULL,
    [IndExclus]   BIT      NOT NULL,
    CONSTRAINT [PK_Gen_FouMQualifArt] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [CleCritereQ] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_FouMQualifArt]
    ON [SA_TMPI].[Gen_FouMQualifArt]([CleArticle] ASC) WITH (FILLFACTOR = 90);

