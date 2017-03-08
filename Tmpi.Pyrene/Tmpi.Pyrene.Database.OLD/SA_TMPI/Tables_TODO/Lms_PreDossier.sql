CREATE TABLE [SA_TMPI].[Lms_PreDossier] (
    [CleSecteur]        SMALLINT      NULL,
    [CleService]        SMALLINT      NULL,
    [ClePreDossier]     INT           IDENTITY (1, 1) NOT NULL,
    [NumPreDossier]     VARCHAR (25)  NULL,
    [CleClient]         INT           NULL,
    [NbrPrelevement]    SMALLINT      CONSTRAINT [DF_Lms_PreDossier_NbrPrelevement] DEFAULT ((0)) NOT NULL,
    [NbrPrelevementMax] SMALLINT      CONSTRAINT [DF_Lms_PreDossier_NbrPrelevementMax] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_Lms_PreDossier_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT      NOT NULL,
    [CleMotif]          SMALLINT      NULL,
    [CleProduit]        SMALLINT      NULL,
    CONSTRAINT [PK_Lms_PreDossier] PRIMARY KEY CLUSTERED ([ClePreDossier] ASC),
    CONSTRAINT [FK1_Lms_PreDossier] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lms_PreDossier] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_Lms_PreDossier] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK4_Lms_PreDossier] FOREIGN KEY ([CleMotif]) REFERENCES [SA_TMPI].[Lmp_MotMotif] ([CleMotif]),
    CONSTRAINT [FK5_Lms_PreDossier] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit])
);

