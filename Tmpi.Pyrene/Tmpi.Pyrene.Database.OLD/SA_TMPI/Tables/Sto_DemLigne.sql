CREATE TABLE [SA_TMPI].[Sto_DemLigne] (
    [CleDemande]          INT             NOT NULL,
    [CleDemLigne]         INT             IDENTITY (1, 1) NOT NULL,
    [TypArticle]          TINYINT         CONSTRAINT [DF_Sto_DemLigne_TypArticle] DEFAULT ((0)) NOT NULL,
    [TypSelection]        TINYINT         CONSTRAINT [DF_Sto_DemLigne_TypSelection] DEFAULT ((1)) NOT NULL,
    [QteCommandee]        DECIMAL (10, 2) NOT NULL,
    [ValConditionB]       DECIMAL (10, 2) CONSTRAINT [DF_Sto_DemLigne_ValConditionB] DEFAULT ((1)) NOT NULL,
    [CodConditionB]       VARCHAR (50)    NULL,
    [CleArticle]          INT             NULL,
    [CleFouArticle]       INT             NULL,
    [NumLotFabricant]     VARCHAR (50)    NULL,
    [TxtLigne]            VARCHAR (4000)  NULL,
    [CleAffectation]      SMALLINT        NULL,
    [QteRecue]            DECIMAL (10, 2) CONSTRAINT [DF_Sto_DemLigne_QteRecue] DEFAULT ((0)) NOT NULL,
    [QteRecue_U]          DECIMAL (15, 3) CONSTRAINT [DF_Sto_DemLigne_QteRecue_U] DEFAULT ((0)) NOT NULL,
    [QteARecevoir]        DECIMAL (10, 2) CONSTRAINT [DF_Sto_DemLigne_QteARecevoir] DEFAULT ((1)) NOT NULL,
    [QteARecevoir_U]      DECIMAL (15, 3) CONSTRAINT [DF_Sto_DemLigne_QteARecevoir_U] DEFAULT ((1)) NOT NULL,
    [NivTraitement]       TINYINT         CONSTRAINT [DF_Sto_DemLigne_NivTraitement] DEFAULT ((0)) NOT NULL,
    [EstACommander]       BIT             CONSTRAINT [DF_Sto_DemLigne_EstACommander] DEFAULT ((0)) NOT NULL,
    [CleCommande]         INT             NULL,
    [CleComLigne]         INT             NULL,
    [EstACreer]           BIT             CONSTRAINT [DF_Sto_DemLigne_EstACreer] DEFAULT ((0)) NOT NULL,
    [EstASupprimer]       BIT             NULL,
    [DatModification]     SMALLDATETIME   NULL,
    [CleModificateur]     SMALLINT        NULL,
    [CodArticle_Old]      VARCHAR (50)    NULL,
    [LibArticle_Old]      VARCHAR (100)   NULL,
    [PrxUnitaire_Old]     DECIMAL (12, 4) NULL,
    [TauRemise_Old]       DECIMAL (5, 2)  NULL,
    [DelLivraison_Old]    SMALLINT        NULL,
    [IndPartielle_Old]    BIT             NULL,
    [CleImput_Old]        SMALLINT        NULL,
    [CleDevise_Old]       SMALLINT        NULL,
    [TauTVA_Old]          DECIMAL (5, 2)  NULL,
    [EstUnTransfert]      BIT             CONSTRAINT [DF_Sto_DemLigne_EstUnTransfert] DEFAULT ((0)) NOT NULL,
    [TypDestockage]       TINYINT         NULL,
    [EstGere]             BIT             CONSTRAINT [DF_Sto_DemLigne_EstGere] DEFAULT ((1)) NOT NULL,
    [QteAcceptee]         DECIMAL (10, 2) NULL,
    [CleMarche]           SMALLINT        NULL,
    [EstSolde]            BIT             CONSTRAINT [DF_Sto_DemLigne_EstSolde] DEFAULT ((0)) NOT NULL,
    [MntEcoParticipation] DECIMAL (9, 4)  CONSTRAINT [DF_Sto_DemLigne_MntEcoParticipation] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sto_DemLigne] PRIMARY KEY CLUSTERED ([CleDemLigne] ASC),
    CONSTRAINT [FK1_StoDemLigne] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Sto_DemDemande] ([CleDemande])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_DemLigne]
    ON [SA_TMPI].[Sto_DemLigne]([CleDemande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_DemLigne]
    ON [SA_TMPI].[Sto_DemLigne]([NivTraitement] ASC);

