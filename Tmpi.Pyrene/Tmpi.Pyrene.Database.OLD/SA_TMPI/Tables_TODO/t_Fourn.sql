﻿CREATE TABLE [SA_TMPI].[t_Fourn] (
    [CleFourn]           SMALLINT        IDENTITY (1, 1) NOT NULL,
    [CodFourn]           VARCHAR (50)    NOT NULL,
    [CodCompta]          VARCHAR (25)    NULL,
    [LibFourn]           VARCHAR (100)   NOT NULL,
    [TxtFourn]           VARCHAR (255)   NULL,
    [AdrRue]             VARCHAR (255)   NULL,
    [AdrCode]            VARCHAR (25)    NULL,
    [AdrVille]           VARCHAR (100)   NULL,
    [NumTelep]           VARCHAR (25)    NULL,
    [NumTelec]           VARCHAR (25)    NULL,
    [NumEMail]           VARCHAR (100)   NULL,
    [NumClient]          VARCHAR (25)    NULL,
    [NomContact]         VARCHAR (50)    NULL,
    [CleDevise]          TINYINT         NULL,
    [ValSPort]           INT             NULL,
    [MntFPort]           DECIMAL (15, 2) NULL,
    [ValDelaiP]          SMALLINT        CONSTRAINT [DF_t_Fourn_ValDelaiP] DEFAULT ((0)) NULL,
    [DelLivraison]       TINYINT         NULL,
    [DatSaisie]          DATETIME        CONSTRAINT [DF_t_Fourn_DatSaisie] DEFAULT (getdate()) NULL,
    [CleOperateur]       SMALLINT        CONSTRAINT [DF_t_Fourn_CleOperateur] DEFAULT ((0)) NULL,
    [NbrModif]           TINYINT         CONSTRAINT [DF_t_Fourn_NbrModif] DEFAULT ((0)) NULL,
    [NumVersion]         TINYINT         CONSTRAINT [DF_t_Fourn_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation]      DATETIME        NULL,
    [CleValideur]        SMALLINT        NULL,
    [MntCommandeMin]     INT             CONSTRAINT [DF_t_Fourn_MntCommandeMin] DEFAULT ((0)) NULL,
    [NumTVAIntra]        VARCHAR (25)    NULL,
    [ValNote]            DECIMAL (5, 2)  NULL,
    [CleModereglement]   SMALLINT        NULL,
    [EstEnvoiMailBonCde] BIT             CONSTRAINT [DF_t_Fourn_EstEnvoiMailBonCde] DEFAULT ((0)) NOT NULL,
    [CleProprietaire]    SMALLINT        NULL,
    CONSTRAINT [PK_t_Fourn] PRIMARY KEY CLUSTERED ([CleFourn] ASC),
    CONSTRAINT [UN1_t_Fourn] UNIQUE NONCLUSTERED ([CodFourn] ASC)
);

