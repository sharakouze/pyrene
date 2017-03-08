CREATE TABLE [SA_TMPI].[TrnP_RscArtParametre] (
    [CleArticle]   INT      NOT NULL,
    [CleParametre] INT      NOT NULL,
    [EstPartage]   BIT      CONSTRAINT [DF_TrnP_RscArtParametre_EstPartage] DEFAULT ((0)) NOT NULL,
    [NbrUnite]     SMALLINT NULL,
    CONSTRAINT [PK_TrnP_RscArtParametre] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [CleParametre] ASC),
    CONSTRAINT [FK1_TrnP_RscArtParametre] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[TrnP_RscArticle] ([CleArticle]),
    CONSTRAINT [FK2_TrnP_RscArtParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

