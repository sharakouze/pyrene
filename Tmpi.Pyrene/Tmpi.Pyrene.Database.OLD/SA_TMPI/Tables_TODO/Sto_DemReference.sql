CREATE TABLE [SA_TMPI].[Sto_DemReference] (
    [CleDemLigne]    INT             NOT NULL,
    [CleFournisseur] SMALLINT        NULL,
    [CleFabricant]   SMALLINT        NULL,
    [RefArticle]     VARCHAR (100)   NULL,
    [LibArticle_F]   VARCHAR (200)   NULL,
    [TxtArticle_F]   VARCHAR (2000)  NULL,
    [ValConditionB]  DECIMAL (10, 3) CONSTRAINT [DF_Sto_DemReference_ValConditionB] DEFAULT ((1)) NOT NULL,
    [ValConditionL]  DECIMAL (10, 3) CONSTRAINT [DF_Sto_DemReference_ValConditionL] DEFAULT ((1)) NOT NULL,
    [ValConditionF]  DECIMAL (10, 3) CONSTRAINT [DF_Sto_DemReference_ValConditionF] DEFAULT ((1)) NOT NULL,
    [PrxUnitaire]    DECIMAL (15, 4) CONSTRAINT [DF_Sto_DemReference_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauRemise]      DECIMAL (5, 2)  CONSTRAINT [DF_Sto_DemReference_TauRemise] DEFAULT ((0)) NOT NULL,
    [DelLivraison]   SMALLINT        NULL,
    CONSTRAINT [PK_Sto_DemReference] PRIMARY KEY CLUSTERED ([CleDemLigne] ASC),
    CONSTRAINT [FK1_Sto_DemReference] FOREIGN KEY ([CleDemLigne]) REFERENCES [SA_TMPI].[Sto_DemLigne] ([CleDemLigne]),
    CONSTRAINT [FK2_Sto_DemReference] FOREIGN KEY ([CleFournisseur]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK3_Sto_DemReference] FOREIGN KEY ([CleFabricant]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

