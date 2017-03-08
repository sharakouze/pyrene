﻿CREATE TABLE [SA_TMPI].[Sto_EcoRepartition] (
    [CleMagasin]     SMALLINT        NULL,
    [CleEcoCommande] INT             NULL,
    [CleEcoLigne]    INT             NULL,
    [CleService]     INT             NULL,
    [PrcRepartition] DECIMAL (5, 2)  NULL,
    [MntReparti]     DECIMAL (12, 2) NULL,
    [TvaRepartie]    DECIMAL (12, 2) NULL,
    [TauTVA]         DECIMAL (5, 2)  NULL
);

