CREATE TABLE [SA_TMPI].[Fct_FacLigne] (
    [CleFacture]        INT             NULL,
    [CleDossier]        INT             NOT NULL,
    [CleDosEchantillon] INT             NULL,
    [TypArticle]        TINYINT         NOT NULL,
    [CleArticle]        INT             NOT NULL,
    [LibArticle]        VARCHAR (200)   NOT NULL,
    [QteArticle]        DECIMAL (10, 2) NOT NULL,
    [PrxUnitaire]       DECIMAL (10, 2) NOT NULL,
    [TauRemise]         DECIMAL (5, 2)  NOT NULL,
    [TauTva]            DECIMAL (5, 2)  NOT NULL,
    [CleTarif]          SMALLINT        NULL,
    [CleTarArticle]     INT             NULL,
    [PrxUnitaireRemise] DECIMAL (10, 2) NOT NULL,
    [CleFacligne]       INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Fct_FacLigne] PRIMARY KEY CLUSTERED ([CleFacligne] ASC),
    CONSTRAINT [FK1_Fct_FacLigne] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[Fct_FacFacture] ([CleFacture]),
    CONSTRAINT [FK2_Fct_FacLigne] FOREIGN KEY ([CleTarif]) REFERENCES [SA_TMPI].[Fcp_TarTarif] ([CleTarif])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Fct_FacLigne]
    ON [SA_TMPI].[Fct_FacLigne]([CleFacture] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Fct_FacLigne]
    ON [SA_TMPI].[Fct_FacLigne]([CleDossier] ASC);

