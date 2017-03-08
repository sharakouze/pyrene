CREATE TABLE [SA_TMPI].[StoP_MagArtAffectation] (
    [CleMagasin]     SMALLINT       NOT NULL,
    [CleArticle]     INT            NOT NULL,
    [CleAffectation] SMALLINT       NOT NULL,
    [PrcRepartition] DECIMAL (5, 2) CONSTRAINT [DF_StoP_MagArtAffectation_PrcRepartition] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StoP_MagArtAffectation] PRIMARY KEY CLUSTERED ([CleMagasin] ASC, [CleArticle] ASC, [CleAffectation] ASC),
    CONSTRAINT [FK1_StoP_MagArtAffectation] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_StoP_MagArtAffectation] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK3_StoP_MagArtAffectation] FOREIGN KEY ([CleAffectation]) REFERENCES [SA_TMPI].[t_BudAffect] ([CleAffect])
);

