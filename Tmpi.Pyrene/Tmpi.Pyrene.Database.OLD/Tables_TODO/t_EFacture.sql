﻿CREATE TABLE [SA_TMPI].[t_EFacture] (
    [CleExercice]      SMALLINT        NOT NULL,
    [CleEFacture]      INT             IDENTITY (1, 1) NOT NULL,
    [NumFacture]       VARCHAR (25)    NOT NULL,
    [DatFacture]       DATETIME        NULL,
    [CleFourn]         SMALLINT        NOT NULL,
    [CleClient]        SMALLINT        NOT NULL,
    [CleImput]         SMALLINT        NULL,
    [CleDevise]        TINYINT         NULL,
    [CleEngage]        INT             NULL,
    [CleECommande]     INT             NULL,
    [MntHT]            DECIMAL (15, 2) CONSTRAINT [DF_t_EFacture_MntHT] DEFAULT ((0)) NOT NULL,
    [MntTVA]           DECIMAL (15, 2) CONSTRAINT [DF_t_EFacture_MntTVA] DEFAULT ((0)) NOT NULL,
    [CleEFactureBord]  INT             NULL,
    [NivSaisie]        TINYINT         CONSTRAINT [DF_t_EFacture_NivSaisie] DEFAULT ((0)) NULL,
    [TxtFacture]       VARCHAR (255)   NULL,
    [CleEFacturePaiem] INT             NULL,
    [DatReception]     DATETIME        NULL,
    [DatReglement]     DATETIME        NULL,
    [CodRegroupe]      VARCHAR (50)    NULL,
    [CleMarche]        SMALLINT        NULL,
    CONSTRAINT [PK_t_EFacture] PRIMARY KEY CLUSTERED ([CleEFacture] ASC),
    CONSTRAINT [FK1_t_EFacture] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK2_t_EFacture] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_t_EFacture] FOREIGN KEY ([CleExercice]) REFERENCES [SA_TMPI].[Gen_DivExercice] ([CleExercice]),
    CONSTRAINT [UN_t_EFacture] UNIQUE NONCLUSTERED ([CleExercice] ASC, [CleFourn] ASC, [NumFacture] ASC)
);

