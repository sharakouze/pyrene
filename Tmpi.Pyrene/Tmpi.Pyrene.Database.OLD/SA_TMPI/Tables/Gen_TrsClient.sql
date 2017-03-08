﻿CREATE TABLE [SA_TMPI].[Gen_TrsClient] (
    [CleTiers]            INT            NOT NULL,
    [ClePayeur]           INT            NULL,
    [TxtClient]           VARCHAR (255)  NULL,
    [AdrRue]              VARCHAR (100)  NULL,
    [AdrCode]             VARCHAR (10)   NULL,
    [AdrVille]            VARCHAR (50)   NULL,
    [ClePays]             TINYINT        NULL,
    [NumTelep]            VARCHAR (25)   NULL,
    [NumTelec]            VARCHAR (25)   NULL,
    [NumEMail]            VARCHAR (50)   NULL,
    [NomContact]          VARCHAR (50)   NULL,
    [MntEncours]          INT            NULL,
    [TypFacturation]      INT            NULL,
    [TypFacture]          INT            NULL,
    [TypSuiviPaiement]    INT            NULL,
    [DelPaiement]         TINYINT        CONSTRAINT [DF_Gen_TrsClient_DelPaiement] DEFAULT ((0)) NOT NULL,
    [JouPaiement]         INT            NULL,
    [TxtFacturation]      VARCHAR (255)  NULL,
    [DatModif]            SMALLDATETIME  NOT NULL,
    [CleOperateur]        SMALLINT       NOT NULL,
    [TauRemise]           DECIMAL (5, 2) NULL,
    [CleTarifPayeur]      SMALLINT       NULL,
    [CleTarifParticulier] SMALLINT       NULL,
    [TauRemiseGlobal]     DECIMAL (5, 2) CONSTRAINT [DF_Gen_TrsClient_TauRemiseGlobal] DEFAULT ((0)) NOT NULL,
    [CleTvaPayeur]        SMALLINT       NULL,
    [TypEcheanceFact]     TINYINT        CONSTRAINT [DF_Gen_TrsClient_TypEcheanceFact] DEFAULT ((0)) NOT NULL,
    [TypEcheancePaiem]    TINYINT        CONSTRAINT [DF_Gen_TrsClient_TypEcheancePaiem] DEFAULT ((0)) NOT NULL,
    [MntEncoursAutorise]  INT            NULL,
    [CleEtat_R]           INT            NULL,
    [EstImprime_R]        BIT            CONSTRAINT [DF_Gen_TrsClient_EstImprime_R] DEFAULT ((1)) NOT NULL,
    [EstEMail_R]          BIT            CONSTRAINT [DF_Gen_TrsClient_EstEMail_R] DEFAULT ((0)) NOT NULL,
    [LstEMail_R]          VARCHAR (200)  NULL,
    [CleEtat_F]           INT            NULL,
    [EstImprime_F]        BIT            CONSTRAINT [DF_Gen_TrsClient_EstImprime_F] DEFAULT ((1)) NOT NULL,
    [EstEMail_F]          BIT            CONSTRAINT [DF_Gen_TrsClient_EstEMail_F] DEFAULT ((0)) NOT NULL,
    [LstEMail_F]          VARCHAR (200)  NULL,
    [CleSecteurRemise]    SMALLINT       NULL,
    CONSTRAINT [PK_Gen_TrsTiersClient] PRIMARY KEY CLUSTERED ([CleTiers] ASC),
    CONSTRAINT [FK1_Gen_TrsClient] FOREIGN KEY ([CleTiers]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers])
);

