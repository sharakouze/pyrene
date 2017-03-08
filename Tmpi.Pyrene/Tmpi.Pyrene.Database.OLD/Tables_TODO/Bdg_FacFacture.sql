﻿CREATE TABLE [SA_TMPI].[Bdg_FacFacture] (
    [CleFacture]       INT             IDENTITY (1, 1) NOT NULL,
    [CleFournisseur]   SMALLINT        NOT NULL,
    [NumFacture]       VARCHAR (50)    NOT NULL,
    [DatFacture]       SMALLDATETIME   NOT NULL,
    [TxtFacture]       VARCHAR (255)   NULL,
    [MntHT]            DECIMAL (10, 2) NOT NULL,
    [TauTVA1]          DECIMAL (5, 2)  NOT NULL,
    [MntTVA1]          DECIMAL (10, 2) NOT NULL,
    [TauTVA2]          DECIMAL (5, 2)  NOT NULL,
    [MntTVA2]          DECIMAL (10, 2) NOT NULL,
    [DatComptable]     SMALLDATETIME   NOT NULL,
    [NumChrono]        INT             NOT NULL,
    [DatEcheance]      SMALLDATETIME   NULL,
    [CodReglement]     VARCHAR (50)    NULL,
    [CodPaiement]      VARCHAR (50)    NULL,
    [CodDomiciliation] VARCHAR (50)    NULL,
    [DatCreation]      SMALLDATETIME   CONSTRAINT [DF_Bdg_FacFacture_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]      SMALLINT        NOT NULL,
    [DatModif]         SMALLDATETIME   NULL,
    [CleOperateur]     SMALLINT        NULL,
    [DatValidation]    SMALLDATETIME   NULL,
    [CleValideur]      SMALLINT        NULL,
    [CleModeReglement] SMALLINT        NOT NULL,
    [CleModePaiement]  SMALLINT        NOT NULL,
    [LibFacture]       VARCHAR (100)   NOT NULL,
    [TypFacture]       TINYINT         NOT NULL,
    CONSTRAINT [PK_Bdg_FacFacture] PRIMARY KEY CLUSTERED ([CleFacture] ASC),
    CONSTRAINT [FK1_Bdg_FacFacture] FOREIGN KEY ([CleFournisseur]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [UN_Bdg_FacFacture] UNIQUE NONCLUSTERED ([CleFournisseur] ASC, [NumFacture] ASC)
);

