CREATE TABLE [SA_TMPI].[TrnP_RscArticle] (
    [CleFamille]  SMALLINT     NOT NULL,
    [CleArticle]  INT          NOT NULL,
    [CodAlias]    VARCHAR (50) NULL,
    [NbrUniteMax] SMALLINT     NULL,
    CONSTRAINT [PK_TrnP_RscArticle] PRIMARY KEY CLUSTERED ([CleArticle] ASC),
    CONSTRAINT [FK1_TrnP_RscArticle] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK2_TrnP_RscArticle] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[TrnP_Rsc_Famille] ([CleFamille])
);

