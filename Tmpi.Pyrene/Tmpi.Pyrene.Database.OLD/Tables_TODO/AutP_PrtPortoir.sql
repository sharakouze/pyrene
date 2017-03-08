﻿CREATE TABLE [SA_TMPI].[AutP_PrtPortoir] (
    [CleFamille]        SMALLINT       NULL,
    [ClePortoir]        SMALLINT       IDENTITY (1, 1) NOT NULL,
    [ClePortoir_C]      SMALLINT       NULL,
    [ClePortoir_H]      SMALLINT       NOT NULL,
    [NumPortoir]        VARCHAR (100)  NOT NULL,
    [LibPortoir]        VARCHAR (200)  NOT NULL,
    [TxtPortoir]        VARCHAR (1000) NULL,
    [PosEchantillonMax] TINYINT        CONSTRAINT [DF_AutP_PrtPortoir_PosEchantillonMax] DEFAULT ((0)) NOT NULL,
    [EstComplet]        BIT            CONSTRAINT [DF_AutP_PrtPortoir_EstComplet] DEFAULT ((0)) NOT NULL,
    [EstGenere]         BIT            CONSTRAINT [DF_AutP_PrtPortoir_EstGenere] DEFAULT ((0)) NOT NULL,
    [EstTransfere]      BIT            CONSTRAINT [DF_AutP_PrtPortoir_EstTransfere] DEFAULT ((0)) NOT NULL,
    [EstActif]          BIT            CONSTRAINT [DF_AutP_PrtPortoir_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME  CONSTRAINT [DF_AutP_PrtPortoir_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT       CONSTRAINT [DF_AutP_PrtPortoir_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [DatValidation]     SMALLDATETIME  NULL,
    [CleValideur]       SMALLINT       NULL,
    [DatVerrouillage]   SMALLDATETIME  NULL,
    [CleVerrouilleur]   SMALLINT       NULL,
    [NumOrdre]          SMALLINT       NULL,
    [CleTravail]        INT            NULL,
    CONSTRAINT [PK_AutP_PrtPortoir] PRIMARY KEY CLUSTERED ([ClePortoir] ASC),
    CONSTRAINT [UN_AutP_PrtPortoir] UNIQUE NONCLUSTERED ([ClePortoir_H] ASC, [NumPortoir] ASC)
);
