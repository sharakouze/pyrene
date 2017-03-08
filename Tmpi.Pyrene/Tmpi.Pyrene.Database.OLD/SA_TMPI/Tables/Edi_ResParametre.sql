﻿CREATE TABLE [SA_TMPI].[Edi_ResParametre] (
    [CleDosParametre]       INT             NOT NULL,
    [CleDossier]            INT             NOT NULL,
    [CleDosPrelevement]     INT             NULL,
    [CleDosEchantillon]     INT             NULL,
    [CleGroupeP]            INT             NOT NULL,
    [CleParametre]          INT             NULL,
    [CleAnalyte]            INT             NULL,
    [CleAnalyte_Ref]        INT             NULL,
    [CleMethode]            INT             NULL,
    [CleMethode_Ref]        INT             NULL,
    [CleMatrice]            INT             NULL,
    [CleMatrice_Ref]        INT             NULL,
    [CleUnite]              INT             NULL,
    [CleExpUnite]           INT             NULL,
    [CleUnite_Ref]          INT             NULL,
    [EstConfirmation]       BIT             NOT NULL,
    [EstAccredite]          BIT             NOT NULL,
    [EstDeTerrain]          BIT             NOT NULL,
    [ValOperateur]          VARCHAR (2)     NULL,
    [ValResultat_N]         DECIMAL (15, 5) NULL,
    [ValIncertitudePrc]     DECIMAL (5, 2)  NULL,
    [ValIncertitudeMin]     DECIMAL (15, 5) NULL,
    [ValIncertitudeMax]     DECIMAL (15, 5) NULL,
    [ValDetection]          DECIMAL (15, 5) NULL,
    [ValQuantification]     DECIMAL (15, 5) NULL,
    [ValReglementaire]      DECIMAL (15, 5) NULL,
    [CleValeur]             INT             NULL,
    [CleValeur_Ref]         INT             NULL,
    [CleInterpretation]     INT             NULL,
    [CleInterpretation_Ref] INT             NULL,
    [CleLaboratoire]        INT             NULL,
    [TxtResultat]           VARCHAR (255)   NULL,
    [DatAnalyse]            SMALLDATETIME   NULL,
    [CleMethodeExtrac]      INT             NULL,
    [CleMethodeExtrac_Ref]  INT             NULL,
    [ValResultat_A]         VARCHAR (255)   NULL,
    CONSTRAINT [PK_Edi_ResParametre] PRIMARY KEY CLUSTERED ([CleDosParametre] ASC)
);

