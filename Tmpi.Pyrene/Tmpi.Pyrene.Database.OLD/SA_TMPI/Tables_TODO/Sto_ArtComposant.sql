CREATE TABLE [SA_TMPI].[Sto_ArtComposant] (
    [CleArticle]   INT             NOT NULL,
    [QteComposant] DECIMAL (10, 4) CONSTRAINT [DF_Sto_ArtComposant_QteComposant] DEFAULT ((0)) NULL,
    [CleComposant] INT             NOT NULL,
    CONSTRAINT [PK_Sto_ArtComposant] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [CleComposant] ASC),
    CONSTRAINT [FK1_Sto_ArtComposant] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_Sto_ArtComposant] FOREIGN KEY ([CleComposant]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_ArtComposant]
    ON [SA_TMPI].[Sto_ArtComposant]([CleArticle] ASC);

