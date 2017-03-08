CREATE TABLE [SA_TMPI].[Sdr_Lms_DosDossier] (
    [CleDossier]      INT           IDENTITY (1, 1) NOT NULL,
    [NumDossier]      VARCHAR (100) NOT NULL,
    [TypDemande]      TINYINT       NOT NULL,
    [NumDemande]      VARCHAR (100) NULL,
    [DatDemande]      SMALLDATETIME NULL,
    [DatDebut]        SMALLDATETIME NULL,
    [DatFin]          SMALLDATETIME NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [NumClient]       VARCHAR (50)  NOT NULL,
    [NumOrgPreleveur] VARCHAR (50)  NULL,
    [NumPayeur]       VARCHAR (50)  NULL,
    [NumLaboratoire]  VARCHAR (50)  NULL,
    [NumDestinataire] VARCHAR (50)  NOT NULL,
    [DatImportation]  SMALLDATETIME NOT NULL,
    [CleExterne]      INT           NULL,
    [CleOrigine]      TINYINT       NULL,
    CONSTRAINT [PK_Sdr_Lms_DosDossier] PRIMARY KEY CLUSTERED ([CleDossier] ASC),
    CONSTRAINT [UN_Sdr_Lms_DosDossier] UNIQUE NONCLUSTERED ([NumDestinataire] ASC, [NumDossier] ASC)
);

