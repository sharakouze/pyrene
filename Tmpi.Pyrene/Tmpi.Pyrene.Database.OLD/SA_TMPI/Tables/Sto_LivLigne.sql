CREATE TABLE [SA_TMPI].[Sto_LivLigne] (
    [CleLivraison]  INT             NOT NULL,
    [CleLivLigne]   INT             IDENTITY (1, 1) NOT NULL,
    [CleDemande]    INT             NOT NULL,
    [CleDemLigne]   INT             NOT NULL,
    [CleArticle]    INT             NULL,
    [CodArticle]    VARCHAR (50)    NULL,
    [LibArticle]    VARCHAR (400)   NULL,
    [QteLivree]     DECIMAL (15, 3) NOT NULL,
    [QteRetournee]  DECIMAL (15, 3) CONSTRAINT [DF_Sto_LivLigne_QteRetournee] DEFAULT ((0)) NOT NULL,
    [CleLot]        INT             NULL,
    [ValConditionB] DECIMAL (10, 3) CONSTRAINT [DF_Sto_LivLigne_ValConditionB] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Sto_LivLigne] PRIMARY KEY CLUSTERED ([CleLivLigne] ASC),
    CONSTRAINT [FK1_Sto_LivLigne] FOREIGN KEY ([CleLivraison]) REFERENCES [SA_TMPI].[Sto_LivLivraison] ([CleLivraison]),
    CONSTRAINT [FK2_Sto_LivLigne] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Sto_DemDemande] ([CleDemande])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_LivLigne]
    ON [SA_TMPI].[Sto_LivLigne]([CleLivraison] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_LivLigne]
    ON [SA_TMPI].[Sto_LivLigne]([CleDemande] ASC);

