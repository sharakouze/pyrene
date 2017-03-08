CREATE TABLE [SA_TMPI].[Lms_DosGroupeP] (
    [CleDossier]        INT            NOT NULL,
    [ClePrelevement]    INT            NULL,
    [CleDosEchantillon] INT            NOT NULL,
    [ClePrdGroupeP]     INT            NULL,
    [CleGroupeP]        INT            NOT NULL,
    [CleDosGroupeP]     INT            IDENTITY (1, 1) NOT NULL,
    [NumOrdre]          SMALLINT       NOT NULL,
    [CleInterpretation] SMALLINT       NULL,
    [TxtInterpretation] VARCHAR (2000) NULL,
    [NivTraitement]     TINYINT        CONSTRAINT [DF_Lms_DosGroupeP_NivTraitement] DEFAULT ((0)) NOT NULL,
    [TxtGroupeP]        VARCHAR (500)  NULL,
    [TypModification]   TINYINT        CONSTRAINT [DF_Lms_DosGroupeP_TypModification] DEFAULT ((0)) NOT NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [EstComplet]        BIT            NULL,
    [DatValidation]     SMALLDATETIME  NULL,
    [CleValideur]       SMALLINT       NULL,
    CONSTRAINT [PK_Lms_DosGroupeP] PRIMARY KEY CLUSTERED ([CleDosGroupeP] ASC),
    CONSTRAINT [FK1_Lms_DosGroupeP] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms_DosGroupeP]
    ON [SA_TMPI].[Lms_DosGroupeP]([CleDossier] ASC);

