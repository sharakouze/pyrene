﻿CREATE TABLE [SA_TMPI].[Fcp_TarArticle] (
    [CleTarifVersion]     SMALLINT        NOT NULL,
    [CleTarifArticle]     INT             IDENTITY (1, 1) NOT NULL,
    [TypArticle]          TINYINT         NOT NULL,
    [CleArticle]          INT             NOT NULL,
    [RefArticle]          VARCHAR (100)   NULL,
    [LibArticle]          VARCHAR (200)   NOT NULL,
    [NbrPoint]            DECIMAL (10, 4) CONSTRAINT [DF_Fcp_TarArticle_NbrPoint] DEFAULT ((0)) NOT NULL,
    [EstGratuit]          BIT             CONSTRAINT [DF_Fcp_TarArticle_EstGratuit] DEFAULT ((0)) NULL,
    [EstActif]            BIT             CONSTRAINT [DF_Fcp_TarArticle_EstActif] DEFAULT ((1)) NULL,
    [DatValidation]       SMALLDATETIME   NULL,
    [PrxUnitaire_Prec]    DECIMAL (10, 2) CONSTRAINT [DF_Fcp_TarArticle_PrxUnitaire_Prec] DEFAULT ((0)) NULL,
    [PrxUnitaire]         DECIMAL (10, 2) CONSTRAINT [DF_Fcp_TarArticle_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [PrxUnitaire_P1]      DECIMAL (10, 2) NULL,
    [PrxUnitaire_Prec_P1] DECIMAL (10, 2) NULL,
    [PrxUnitaire_P2]      DECIMAL (10, 2) NULL,
    [PrxUnitaire_Prec_P2] DECIMAL (10, 2) NULL,
    [PrxUnitaire_P3]      DECIMAL (10, 2) NULL,
    [PrxUnitaire_Prec_P3] DECIMAL (10, 2) NULL,
    [PrxUnitaire_P4]      DECIMAL (10, 2) NULL,
    [PrxUnitaire_Prec_P4] DECIMAL (10, 2) NULL,
    CONSTRAINT [PK_Fcp_TarArticle] PRIMARY KEY CLUSTERED ([CleTarifArticle] ASC),
    CONSTRAINT [FK1_Fcp_TarArticle] FOREIGN KEY ([CleTarifVersion]) REFERENCES [SA_TMPI].[Fcp_TarVersion] ([CleTarifVersion]),
    CONSTRAINT [UN_Fcp_TarArticle] UNIQUE NONCLUSTERED ([CleArticle] ASC, [CleTarifVersion] ASC, [TypArticle] ASC)
);

