CREATE TABLE [SA_TMPI].[Sto_AppelTarif] (
    [CleAppelTarif]  INT             IDENTITY (1, 1) NOT NULL,
    [CleAppel]       SMALLINT        NOT NULL,
    [CleArticle]     INT             NOT NULL,
    [CleFournisseur] SMALLINT        NOT NULL,
    [RefArticle]     VARCHAR (50)    NULL,
    [LibArticle]     VARCHAR (100)   NOT NULL,
    [PrxUnitaire]    DECIMAL (15, 4) NOT NULL,
    [TauRemise]      DECIMAL (5, 2)  NOT NULL,
    [ValConditionB]  DECIMAL (10, 3) NOT NULL,
    [ValConditionL]  DECIMAL (10, 3) NOT NULL,
    [ValConditionF]  DECIMAL (10, 3) NOT NULL,
    [QteArticle]     DECIMAL (15, 3) NOT NULL,
    CONSTRAINT [PK_Sto_AppelTarif] PRIMARY KEY CLUSTERED ([CleAppelTarif] ASC),
    CONSTRAINT [FK1_Sto_AppelTarif] FOREIGN KEY ([CleAppel]) REFERENCES [SA_TMPI].[t_Appel] ([CleAppel]),
    CONSTRAINT [FK2_Sto_AppelTarif] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle]),
    CONSTRAINT [FK3_Sto_AppelTarif] FOREIGN KEY ([CleFournisseur]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

