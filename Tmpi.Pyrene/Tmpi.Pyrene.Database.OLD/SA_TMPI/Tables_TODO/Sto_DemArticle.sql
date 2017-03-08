CREATE TABLE [SA_TMPI].[Sto_DemArticle] (
    [CleDemLigne]     INT            NOT NULL,
    [CleDomaine]      SMALLINT       NULL,
    [CleFamille]      SMALLINT       NULL,
    [CleSFamille]     SMALLINT       NULL,
    [CodArticle]      VARCHAR (100)  NULL,
    [LibArticle]      VARCHAR (200)  NULL,
    [TxtArticle]      VARCHAR (2000) NULL,
    [CleUnite]        SMALLINT       NULL,
    [CleImputation]   SMALLINT       NULL,
    [CleNomenclature] SMALLINT       NULL,
    [TauTVA]          DECIMAL (5, 2) NULL,
    CONSTRAINT [PK_Sto_DemArticle] PRIMARY KEY CLUSTERED ([CleDemLigne] ASC),
    CONSTRAINT [FK1_Sto_DemArticle] FOREIGN KEY ([CleDemLigne]) REFERENCES [SA_TMPI].[Sto_DemLigne] ([CleDemLigne]),
    CONSTRAINT [FK2_Sto_DemArticle] FOREIGN KEY ([CleDomaine]) REFERENCES [SA_TMPI].[t_Domaine] ([CleDomaine]),
    CONSTRAINT [FK3_Sto_DemArticle] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[t_ArtFamille] ([CleFamille]),
    CONSTRAINT [FK4_Sto_DemArticle] FOREIGN KEY ([CleSFamille]) REFERENCES [SA_TMPI].[t_ArtSFamille] ([CleSFamille]),
    CONSTRAINT [FK5_Sto_DemArticle] FOREIGN KEY ([CleUnite]) REFERENCES [SA_TMPI].[t_Unite] ([CleUnite]),
    CONSTRAINT [FK6_Sto_DemArticle] FOREIGN KEY ([CleImputation]) REFERENCES [SA_TMPI].[t_Imput] ([CleImput]),
    CONSTRAINT [FK7_Sto_DemArticle] FOREIGN KEY ([CleNomenclature]) REFERENCES [SA_TMPI].[t_ArtNomenc] ([CleNomenc])
);

