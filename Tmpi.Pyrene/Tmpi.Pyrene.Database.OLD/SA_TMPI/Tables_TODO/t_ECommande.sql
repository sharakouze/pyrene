CREATE TABLE [SA_TMPI].[t_ECommande] (
    [CleExercice]            SMALLINT        NOT NULL,
    [CleFourn]               SMALLINT        NOT NULL,
    [CleClient]              SMALLINT        NOT NULL,
    [CleEngage]              INT             NOT NULL,
    [CleECommande]           INT             IDENTITY (1, 1) NOT NULL,
    [NumCommande]            VARCHAR (25)    NULL,
    [TypCommande]            TINYINT         CONSTRAINT [DF_t_ECommande_TypCommande] DEFAULT ((1)) NOT NULL,
    [DatCommande]            SMALLDATETIME   CONSTRAINT [DF_t_ECommande_DatCommande] DEFAULT (getdate()) NOT NULL,
    [TxtCommande]            VARCHAR (255)   NULL,
    [DatLivraison]           DATETIME        NULL,
    [AdrLivraison]           VARCHAR (255)   NULL,
    [DelLivraison]           SMALLINT        CONSTRAINT [DF_t_ECommande_DelLivraison] DEFAULT ((0)) NOT NULL,
    [CleImput]               SMALLINT        NULL,
    [CleDevise]              TINYINT         CONSTRAINT [DF_t_ECommande_CleDevise] DEFAULT ((1)) NULL,
    [MntHT]                  DECIMAL (15, 2) CONSTRAINT [DF_t_ECommande_MntHT] DEFAULT ((0)) NOT NULL,
    [MntTVA]                 DECIMAL (15, 2) CONSTRAINT [DF_t_ECommande_MntTVA] DEFAULT ((0)) NOT NULL,
    [IndSolde]               BIT             CONSTRAINT [DF_t_ECommande_IndSolde] DEFAULT ((0)) NOT NULL,
    [NomDemandeur]           VARCHAR (50)    NOT NULL,
    [CleValideur]            SMALLINT        NULL,
    [IndMagasin]             BIT             CONSTRAINT [DF_t_ECommande_IndMagasin] DEFAULT ((1)) NOT NULL,
    [NivSaisie]              TINYINT         CONSTRAINT [DF_t_ECommande_NivSaisie] DEFAULT ((1)) NOT NULL,
    [DatValidation]          DATETIME        NULL,
    [CleECommandeR]          INT             NULL,
    [CleBudget]              SMALLINT        NULL,
    [CleMagasin]             SMALLINT        NULL,
    [CleMarche]              SMALLINT        NULL,
    [CleNomenc]              SMALLINT        NULL,
    [CleMotif]               SMALLINT        NULL,
    [CleAbonnement]          SMALLINT        NULL,
    [EstCdeAuto]             BIT             CONSTRAINT [DF_t_ECommande_EstCdeAuto] DEFAULT ((0)) NOT NULL,
    [DatEnvoi]               SMALLDATETIME   NULL,
    [EstMarcheUnique]        BIT             CONSTRAINT [DF_t_ECommande_EstMarcheUnique] DEFAULT ((0)) NOT NULL,
    [MntRealise]             DECIMAL (15, 2) CONSTRAINT [DF_t_ECommande_MntRealise] DEFAULT ((0)) NULL,
    [MntFacture]             DECIMAL (15, 2) CONSTRAINT [DF_t_ECommande_MntFacture] DEFAULT ((0)) NULL,
    [CleServiceDest]         SMALLINT        NULL,
    [MntEcoParticipationTTC] DECIMAL (9, 2)  CONSTRAINT [DF_t_ECommande_MntEcoParticipationTTC] DEFAULT ((0)) NOT NULL,
    [TxtCritere]             VARCHAR (255)   NULL,
    [CleDemande]             INT             NULL,
    CONSTRAINT [PK_t_ECommande] PRIMARY KEY CLUSTERED ([CleECommande] ASC),
    CONSTRAINT [FK1_t_ECommande] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK2_t_ECommande] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_t_ECommande] FOREIGN KEY ([CleExercice]) REFERENCES [SA_TMPI].[Gen_DivExercice] ([CleExercice])
);


GO
CREATE NONCLUSTERED INDEX [IDX1_ECommande]
    ON [SA_TMPI].[t_ECommande]([NumCommande] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID2_t_ECommande]
    ON [SA_TMPI].[t_ECommande]([CleMarche] ASC);

