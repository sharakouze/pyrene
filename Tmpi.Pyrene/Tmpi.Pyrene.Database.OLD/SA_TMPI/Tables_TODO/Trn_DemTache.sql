﻿CREATE TABLE [SA_TMPI].[Trn_DemTache] (
    [CleDemande]         INT            NOT NULL,
    [CleDemTache]        INT            IDENTITY (1, 1) NOT NULL,
    [TypTache]           TINYINT        NOT NULL,
    [TxtTache]           VARCHAR (4000) NULL,
    [ClePoint]           INT            NOT NULL,
    [NbrEchant]          TINYINT        NOT NULL,
    [CleProduit]         SMALLINT       NOT NULL,
    [CleMatrice]         SMALLINT       NULL,
    [NumJour]            TINYINT        NULL,
    [DatPrevue]          SMALLDATETIME  NULL,
    [HeuPrevue]          SMALLINT       NULL,
    [DatDebut]           SMALLDATETIME  NOT NULL,
    [DatFin]             SMALLDATETIME  NOT NULL,
    [TxtDate]            VARCHAR (50)   NULL,
    [IndPlanification]   BIT            NULL,
    [DatDebutPeriode]    SMALLDATETIME  NULL,
    [DatFinPeriode]      SMALLDATETIME  NULL,
    [NbrRepetition]      TINYINT        CONSTRAINT [DF_Trn_DemTache_NbrRepetition] DEFAULT ((0)) NOT NULL,
    [ValPeriode]         TINYINT        CONSTRAINT [DF_Trn_DemTache_ValPeriode] DEFAULT ((0)) NOT NULL,
    [UniPeriode]         VARCHAR (15)   NULL,
    [SQLPeriode]         VARCHAR (10)   NULL,
    [DatRealisation]     DATETIME       NULL,
    [IndRePlanification] BIT            CONSTRAINT [DF_Trn_DemTache_IndRePlanification] DEFAULT ((0)) NOT NULL,
    [NivPriorite]        TINYINT        CONSTRAINT [DF_Trn_DemTache_NivPriorite] DEFAULT ((1)) NOT NULL,
    [TxtTachePriorite]   VARCHAR (500)  NULL,
    [TxtTacheSuspendu]   VARCHAR (500)  NULL,
    [IndAtypique]        BIT            CONSTRAINT [DF_Trn_DemTache_IndAtypique] DEFAULT ((0)) NOT NULL,
    [IndSuspendu]        BIT            CONSTRAINT [DF_Trn_DemTache_IndSuspendu] DEFAULT ((1)) NOT NULL,
    [TxtTacheAtypique]   VARCHAR (500)  NULL,
    [NivAvancement]      TINYINT        NULL,
    [CleTournee]         INT            NULL,
    [ClePreleveur]       SMALLINT       NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [NumOrdre]           SMALLINT       NULL,
    [CleSecteur]         SMALLINT       NOT NULL,
    [ValIntervalleMini]  TINYINT        NULL,
    [DatGenerationMax]   SMALLDATETIME  NULL,
    [CleTacheReference]  INT            NULL,
    [CleTacheSuivante]   INT            NULL,
    [PosJour]            TINYINT        NOT NULL,
    [CleProcedure]       SMALLINT       NULL,
    [ValIntervalleMaxi]  TINYINT        NULL,
    [TypHeure]           TINYINT        NOT NULL,
    [EstImporte]         BIT            CONSTRAINT [DF_Trn_DemTache_EstImporte] DEFAULT ((0)) NOT NULL,
    [CleContrainte]      SMALLINT       NULL,
    [EstSupprime]        BIT            CONSTRAINT [DF_Trn_DemTache_EstSupprime] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Trn_DemTache] PRIMARY KEY CLUSTERED ([CleDemTache] ASC),
    CONSTRAINT [FK1_Trn_DemTache] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Trn_DemDemande] ([CleDemande]),
    CONSTRAINT [FK2_Trn_DemTache] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint]),
    CONSTRAINT [FK3_Trn_DemTache] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK4_Trn_DemTache] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [FK5_Trn_DemTache] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur]),
    CONSTRAINT [FK6_Trn_DemTache] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemTache]
    ON [SA_TMPI].[Trn_DemTache]([CleDemande] ASC);
