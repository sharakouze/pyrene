CREATE TABLE [SA_TMPI].[t_ECommandeLig] (
    [CleECommande]        INT             NOT NULL,
    [CleECommandeLig]     INT             IDENTITY (1, 1) NOT NULL,
    [CleArticle]          INT             CONSTRAINT [DF_t_ECommandeLig_CleArticle] DEFAULT ((0)) NOT NULL,
    [CleArticleTarif]     INT             CONSTRAINT [DF_t_ECommandeLig_CleArticleTarif] DEFAULT ((0)) NOT NULL,
    [TypArticle]          TINYINT         NOT NULL,
    [CleUnite]            SMALLINT        NOT NULL,
    [CleImput]            SMALLINT        NULL,
    [QteCommandee]        DECIMAL (15, 3) NOT NULL,
    [QteARecevoir_U]      DECIMAL (15, 3) NOT NULL,
    [QteRecue_U]          DECIMAL (15, 3) CONSTRAINT [DF_t_ECommandeLig_QteRecue_U] DEFAULT ((0)) NOT NULL,
    [CleDevise]           TINYINT         NULL,
    [PrxUnitaire]         DECIMAL (15, 4) NOT NULL,
    [TauRemise]           DECIMAL (5, 2)  NOT NULL,
    [TauTVA]              DECIMAL (5, 2)  CONSTRAINT [DF_t_ECommandeLig_TauTVA] DEFAULT ((1)) NOT NULL,
    [DelLivraison]        TINYINT         NULL,
    [IndPartielle]        BIT             CONSTRAINT [DF_t_ECommandeLig_IndPartielle] DEFAULT ((0)) NOT NULL,
    [RefArticle]          VARCHAR (50)    NULL,
    [LibArticle]          VARCHAR (255)   NOT NULL,
    [CodArticle]          VARCHAR (50)    NULL,
    [IndFacturee]         BIT             CONSTRAINT [DF_t_ECommandeLig_IndFacturee] DEFAULT ((0)) NOT NULL,
    [CleNomenc]           SMALLINT        NULL,
    [ValConditionB]       DECIMAL (10, 3) CONSTRAINT [DF_t_ECommandeLig_ValConditionB] DEFAULT ((1)) NOT NULL,
    [ValConditionL]       DECIMAL (10, 3) CONSTRAINT [DF_t_ECommandeLig_ValConditionL] DEFAULT ((1)) NOT NULL,
    [ValConditionF]       DECIMAL (10, 3) CONSTRAINT [DF_t_ECommandeLig_ValConditionF] DEFAULT ((1)) NOT NULL,
    [CleMarche]           SMALLINT        NULL,
    [EstCdeAuto]          BIT             CONSTRAINT [DF_t_ECommandeLig_EstCdeAuto] DEFAULT ((0)) NOT NULL,
    [DatCreation]         DATETIME        CONSTRAINT [DF_t_ECommandeLig_DatCreation] DEFAULT (getdate()) NULL,
    [CleCreateur]         SMALLINT        CONSTRAINT [DF_t_ECommandeLig_CleCreateur] DEFAULT ((0)) NULL,
    [DatModif]            DATETIME        NULL,
    [CleOperateur]        SMALLINT        NULL,
    [QteReservee]         DECIMAL (15, 3) CONSTRAINT [DF_t_ECommandeLig_QteReservee] DEFAULT ((0)) NOT NULL,
    [TxtLigne]            VARCHAR (4000)  NULL,
    [MntEcoParticipation] DECIMAL (9, 4)  CONSTRAINT [DF_t_ECommandeLig_MntEcoParticipation] DEFAULT ((0)) NOT NULL,
    [QteALivrer]          INT             CONSTRAINT [DF_t_ECommandeLig_QteALivrer] DEFAULT ((0)) NOT NULL,
    [NumEngLigne]         TINYINT         NULL,
    CONSTRAINT [PK_t_ECommandeLig] PRIMARY KEY CLUSTERED ([CleECommandeLig] ASC),
    CONSTRAINT [FK1_t_ECommandeLig] FOREIGN KEY ([CleECommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande]),
    CONSTRAINT [FK8_t_ECommandeLig] FOREIGN KEY ([CleImput]) REFERENCES [SA_TMPI].[t_Imput] ([CleImput])
);


GO
CREATE NONCLUSTERED INDEX [ID1_ECommandeLig]
    ON [SA_TMPI].[t_ECommandeLig]([CleECommande] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID2_t_ECommandeLig]
    ON [SA_TMPI].[t_ECommandeLig]([CleMarche] ASC);

