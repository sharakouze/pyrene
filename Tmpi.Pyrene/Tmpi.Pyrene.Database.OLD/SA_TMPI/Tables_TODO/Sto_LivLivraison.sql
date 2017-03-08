CREATE TABLE [SA_TMPI].[Sto_LivLivraison] (
    [CleLivraison]   INT           IDENTITY (1, 1) NOT NULL,
    [NumLivraison]   VARCHAR (25)  NULL,
    [DatLivraison]   SMALLDATETIME NOT NULL,
    [CleMagasin]     SMALLINT      NOT NULL,
    [CleClient]      SMALLINT      NOT NULL,
    [CleValideur]    SMALLINT      NOT NULL,
    [CleFacture]     INT           NULL,
    [CleDemande_Old] INT           NULL,
    [NivSaisie_Old]  TINYINT       CONSTRAINT [DF_Sto_LivLivraison_NivSaisie_Old] DEFAULT ((9)) NOT NULL,
    [NivFactu_Old]   TINYINT       CONSTRAINT [DF_Sto_LivLivraison_NivFactu_Old] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sto_LivLivraison] PRIMARY KEY CLUSTERED ([CleLivraison] ASC),
    CONSTRAINT [FK1_Sto_LivLivraison] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_Sto_LivLivraison] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Sto_LivLivraison] UNIQUE NONCLUSTERED ([NumLivraison] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_LivLivraison]
    ON [SA_TMPI].[Sto_LivLivraison]([CleMagasin] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_LivLivraison]
    ON [SA_TMPI].[Sto_LivLivraison]([CleClient] ASC);

