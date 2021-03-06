﻿CREATE TABLE [SA_TMPI].[t_ArtListe] (
    [CleListe]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodListe]      VARCHAR (50)  NOT NULL,
    [LibListe]      VARCHAR (100) NOT NULL,
    [TxtListe]      VARCHAR (255) NULL,
    [CodTable]      VARCHAR (50)  NOT NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_ArtListe] PRIMARY KEY CLUSTERED ([CleListe] ASC),
    CONSTRAINT [UN_t_ArtListe] UNIQUE NONCLUSTERED ([CodListe] ASC)
);

