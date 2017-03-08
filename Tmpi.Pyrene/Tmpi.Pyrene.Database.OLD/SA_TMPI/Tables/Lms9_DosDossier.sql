CREATE TABLE [SA_TMPI].[Lms9_DosDossier] (
    [CleClasse]          SMALLINT       NULL,
    [CleDossier]         INT            NOT NULL,
    [NumDossier]         VARCHAR (25)   NULL,
    [TxtDossier]         VARCHAR (500)  NULL,
    [CleMotif]           SMALLINT       NULL,
    [CleDevis]           INT            NULL,
    [ClePrescripteur]    INT            NULL,
    [CleClient]          INT            NULL,
    [ClePayeur]          INT            NULL,
    [CleOrgPreleveur]    INT            NULL,
    [CleLaboratoire]     INT            NULL,
    [NivTraitement]      TINYINT        NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF_Lms9_DosDossier_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [NbrEchantillon]     SMALLINT       NOT NULL,
    [DatRefFacturation]  SMALLDATETIME  NULL,
    [CleMNumero_D]       SMALLINT       NOT NULL,
    [CleMNumero_E]       SMALLINT       NOT NULL,
    [CleDossier_Source]  INT            NULL,
    [CleDossier_Cible]   INT            NULL,
    [NumRevision]        TINYINT        NULL,
    [DatRevision]        SMALLDATETIME  NULL,
    [CleReviseur]        INT            NULL,
    [EstImpressionAuto]  BIT            NOT NULL,
    [EstFacturationAuto] BIT            NOT NULL,
    [CleSecteur]         SMALLINT       NULL,
    [CleService]         SMALLINT       NULL,
    [TypEcheanceFact]    TINYINT        NOT NULL,
    [DelPaiement]        TINYINT        NOT NULL,
    [TypEcheancePaiem]   TINYINT        NOT NULL,
    [TauTVAReference]    DECIMAL (5, 2) NULL,
    [TauRemiseGlobal]    DECIMAL (5, 2) NOT NULL,
    [CleTarifReference]  SMALLINT       NULL,
    [CleTarifMetier]     SMALLINT       NULL,
    [CleTarifPayeur]     SMALLINT       NULL,
    [DatEcheance]        SMALLDATETIME  NULL,
    [DatFacturation]     SMALLDATETIME  NULL,
    [CleFacture]         INT            NULL,
    [CleDemande]         INT            NULL,
    [CleFeuille]         INT            NULL,
    [CleAtelier]         INT            NULL,
    [NivPrelevement]     VARCHAR (1)    NULL,
    [DatReception]       SMALLDATETIME  NULL,
    [DatPrelevement]     SMALLDATETIME  NULL,
    [NumDemande]         VARCHAR (50)   NULL,
    [CleProduit]         SMALLINT       NULL,
    [TypInterpretation]  SMALLINT       NULL,
    [TypValidation]      SMALLINT       NULL,
    [EstAccredite]       BIT            CONSTRAINT [DF_Lms9_DosDossierEstAccredite] DEFAULT ((0)) NOT NULL,
    [EstFacturable]      BIT            CONSTRAINT [DF_Lms9_DosDossierEstFacturable] DEFAULT ((0)) NOT NULL,
    [EstPaye]            BIT            CONSTRAINT [DF_Lms9_DosDossierEstPaye] DEFAULT ((0)) NOT NULL,
    [CleEtablissement]   INT            NULL,
    [TypIdentPP]         TINYINT        NULL,
    [NumPointP]          VARCHAR (50)   NULL,
    [NomPointP]          VARCHAR (100)  NULL,
    [TypIdentPS]         TINYINT        NULL,
    [NumPointS]          VARCHAR (50)   NULL,
    [NomPointS]          VARCHAR (100)  NULL,
    CONSTRAINT [PK_Lm9_DosDossier] PRIMARY KEY CLUSTERED ([CleDossier] ASC),
    CONSTRAINT [FK1_Lms9_DosDossier] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lms9_DosDossier] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lm9_DosDossier]
    ON [SA_TMPI].[Lms9_DosDossier]([NumDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosDossier]
    ON [SA_TMPI].[Lms9_DosDossier]([CleClient] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms9_DosDossier]
    ON [SA_TMPI].[Lms9_DosDossier]([CleMotif] ASC);

