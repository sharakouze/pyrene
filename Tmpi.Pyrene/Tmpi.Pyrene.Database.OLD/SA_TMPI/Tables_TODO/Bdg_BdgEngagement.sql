﻿CREATE TABLE [SA_TMPI].[Bdg_BdgEngagement] (
    [CleBudget]      SMALLINT        NOT NULL,
    [CleSection]     SMALLINT        NOT NULL,
    [CleAction]      SMALLINT        NOT NULL,
    [CleFournisseur] SMALLINT        NOT NULL,
    [CleEngagement]  SMALLINT        IDENTITY (1, 1) NOT NULL,
    [NumEngagement]  VARCHAR (50)    NOT NULL,
    [LibEngagement]  VARCHAR (100)   NOT NULL,
    [TxtEngagement]  VARCHAR (255)   NULL,
    [MntEngage]      DECIMAL (10, 2) NOT NULL,
    [EstActif]       BIT             CONSTRAINT [DF_Bdg_BdgEngagement_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME   CONSTRAINT [DF_Bdg_BdgEngagement_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT        NOT NULL,
    [DatModif]       SMALLDATETIME   NULL,
    [CleOperateur]   SMALLINT        NULL,
    [DatValidation]  SMALLDATETIME   NULL,
    [CleValideur]    SMALLINT        NULL,
    [CleRubrique]    SMALLINT        NOT NULL,
    [ClePoste]       SMALLINT        NOT NULL,
    [CleResponsable] SMALLINT        NULL,
    CONSTRAINT [PK_Bdg_BdgEngagement] PRIMARY KEY CLUSTERED ([CleEngagement] ASC),
    CONSTRAINT [FK1_Bdg_BdgEngagement] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[Bdg_BdgBudget] ([CleBudget]),
    CONSTRAINT [FK2_Bdg_BdgEngagement] FOREIGN KEY ([CleSection]) REFERENCES [SA_TMPI].[Bdg_Bdg_Section] ([CleSection]),
    CONSTRAINT [FK4_Bdg_BdgEngagement] FOREIGN KEY ([CleFournisseur]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [UN_Bdg_BdgEngagement] UNIQUE NONCLUSTERED ([CleBudget] ASC, [NumEngagement] ASC)
);

