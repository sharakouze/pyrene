CREATE TABLE [SA_TMPI].[Sto_ArtControle] (
    [CleArticle]     INT           NOT NULL,
    [CleArtControle] INT           IDENTITY (1, 1) NOT NULL,
    [NumOrdre]       TINYINT       NULL,
    [CodControle]    VARCHAR (50)  NOT NULL,
    [CodMatrice]     VARCHAR (50)  NOT NULL,
    [TxtProtocole]   VARCHAR (200) NOT NULL,
    [TxtResultat]    VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Sto_ArtControle] PRIMARY KEY CLUSTERED ([CleArtControle] ASC),
    CONSTRAINT [FK1_Sto_ArtControle] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_ArtControle]
    ON [SA_TMPI].[Sto_ArtControle]([CleArticle] ASC);

