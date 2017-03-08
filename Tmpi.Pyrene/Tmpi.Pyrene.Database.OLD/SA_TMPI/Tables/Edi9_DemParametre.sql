﻿CREATE TABLE [SA_TMPI].[Edi9_DemParametre] (
    [CleEdiParametre]   INT             NOT NULL,
    [CleEdiDemande]     INT             NOT NULL,
    [CleEdiPrelevement] INT             NULL,
    [CleEdiEchantillon] INT             NULL,
    [CleGroupeP]        INT             NULL,
    [CleGroupeP_Ref]    INT             NULL,
    [CleMatrice]        INT             NULL,
    [CleMatrice_Ref]    INT             NULL,
    [CleAnalyte]        INT             NULL,
    [CleAnalyte_Ref]    INT             NULL,
    [CleMethode]        INT             NULL,
    [CleMethode_Ref]    INT             NULL,
    [CleParametre]      INT             NULL,
    [CleUnite]          INT             NULL,
    [CleUnite_Ref]      INT             NULL,
    [EstDeTerrain]      BIT             NOT NULL,
    [TypUsage]          VARCHAR (1)     NULL,
    [TxtParametre]      VARCHAR (255)   NULL,
    [ValResultat_N]     DECIMAL (15, 5) NULL,
    [ValResultat_A]     VARCHAR (255)   NULL,
    [CleValeur]         INT             NULL,
    [CleValeur_Ref]     INT             NULL,
    CONSTRAINT [PK_Edi9_DemParametre] PRIMARY KEY CLUSTERED ([CleEdiParametre] ASC),
    CONSTRAINT [FK1_Edi9_DemParametre] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi9_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi9_DemParametre] FOREIGN KEY ([CleEdiPrelevement]) REFERENCES [SA_TMPI].[Edi9_DemPrelevement] ([CleEdiPrelevement]),
    CONSTRAINT [FK3_Edi9_DemParametre] FOREIGN KEY ([CleEdiEchantillon]) REFERENCES [SA_TMPI].[Edi9_DemEchantillon] ([CleEdiEchantillon]),
    CONSTRAINT [UN_Edi9_DemParametre] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [CleEdiEchantillon] ASC, [CleGroupeP_Ref] ASC, [CleAnalyte_Ref] ASC, [CleMethode_Ref] ASC)
);
