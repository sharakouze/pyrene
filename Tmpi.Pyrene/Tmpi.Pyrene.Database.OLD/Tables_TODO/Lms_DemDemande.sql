﻿CREATE TABLE [SA_TMPI].[Lms_DemDemande] (
    [CleDemande]      INT           IDENTITY (1, 1) NOT NULL,
    [CleSI]           INT           NOT NULL,
    [TypReferentiel]  TINYINT       NOT NULL,
    [NumDemande]      VARCHAR (100) NOT NULL,
    [TxtDemande]      VARCHAR (255) NULL,
    [DatDemande]      SMALLDATETIME NULL,
    [DatIntervention] SMALLDATETIME NULL,
    [DatDebut]        SMALLDATETIME NULL,
    [DatFin]          SMALLDATETIME NULL,
    [CleClient]       INT           NOT NULL,
    [CleTypIdent_C]   TINYINT       NULL,
    [CleOrgPreleveur] INT           NULL,
    [CleTypIdent_OP]  TINYINT       NULL,
    [CleTypIdent_A]   TINYINT       NULL,
    [ClePrescripteur] INT           NULL,
    [CleLaboratoire]  INT           NULL,
    [CleMotif]        SMALLINT      NULL,
    [NivTraitement]   TINYINT       NOT NULL,
    [DatCreation]     SMALLDATETIME NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModif]        SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [CleOrigine]      TINYINT       NULL,
    [CleExterne]      INT           NULL,
    [NivPrelevement]  VARCHAR (10)  NULL,
    [NbrEchantillon]  SMALLINT      NULL,
    [CleMatriceDef]   SMALLINT      NULL,
    [TypIdentPP]      TINYINT       NULL,
    [NumPointP]       VARCHAR (50)  NULL,
    [NomPointP]       VARCHAR (100) NULL,
    [TypIdentPS]      TINYINT       NULL,
    [NumPointS]       VARCHAR (50)  NULL,
    [NomPointS]       VARCHAR (100) NULL,
    [ClePointP]       INT           NULL,
    [ClePointS]       INT           NULL,
    CONSTRAINT [PK_Lms_DemDemande] PRIMARY KEY CLUSTERED ([CleDemande] ASC),
    CONSTRAINT [FK1_Lms_DemDemande] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK2_Lms_DemDemande] FOREIGN KEY ([CleOrgPreleveur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK4_Lms_DemDemande] FOREIGN KEY ([ClePrescripteur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK5_Lms_DemDemande] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK6_Lms_DemDemande] FOREIGN KEY ([CleMotif]) REFERENCES [SA_TMPI].[Lmp_MotMotif] ([CleMotif]),
    CONSTRAINT [UN_Lms_DemDemande] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [NumDemande] ASC)
);

