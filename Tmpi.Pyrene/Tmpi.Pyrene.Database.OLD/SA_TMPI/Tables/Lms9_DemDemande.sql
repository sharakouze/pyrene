﻿CREATE TABLE [SA_TMPI].[Lms9_DemDemande] (
    [CleDemande]      INT           NOT NULL,
    [CleSI]           TINYINT       NOT NULL,
    [TypReferentiel]  TINYINT       NOT NULL,
    [NumDemande]      VARCHAR (100) NOT NULL,
    [TxtDemande]      VARCHAR (255) NULL,
    [DatDemande]      SMALLDATETIME NULL,
    [DatIntervention] SMALLDATETIME NULL,
    [DatDebut]        SMALLDATETIME NULL,
    [DatFin]          SMALLDATETIME NULL,
    [CleClient]       INT           NOT NULL,
    [CleTypIdent_C]   TINYINT       NULL,
    [CleOrgPreleveur] INT           NOT NULL,
    [CleTypIdent_OP]  TINYINT       NULL,
    [CleAtelier]      INT           NULL,
    [CleTypIdent_A]   TINYINT       NULL,
    [ClePrescripteur] INT           NOT NULL,
    [CleLaboratoire]  INT           NOT NULL,
    [CleMotif]        SMALLINT      NULL,
    [NivTraitement]   TINYINT       NOT NULL,
    [DatCreation]     SMALLDATETIME NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModif]        SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    CONSTRAINT [PK_Lms9_DemDemande] PRIMARY KEY CLUSTERED ([CleDemande] ASC),
    CONSTRAINT [UN_Lms9_DemDemande] UNIQUE NONCLUSTERED ([NumDemande] ASC)
);

