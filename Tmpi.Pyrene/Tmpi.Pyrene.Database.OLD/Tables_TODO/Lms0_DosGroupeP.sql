CREATE TABLE [SA_TMPI].[Lms0_DosGroupeP] (
    [CleDossier]        INT            NOT NULL,
    [ClePrelevement]    INT            NOT NULL,
    [CleDosEchantillon] INT            NOT NULL,
    [ClePrdGroupeP]     INT            NULL,
    [CleGroupeP]        INT            NOT NULL,
    [CleDosGroupeP]     INT            IDENTITY (1, 1) NOT NULL,
    [NumOrdre]          SMALLINT       NOT NULL,
    [CleInterpretation] SMALLINT       NULL,
    [TxtInterpretation] VARCHAR (2000) NULL,
    [NivTraitement]     TINYINT        NOT NULL,
    [TxtGroupeP]        VARCHAR (500)  NULL,
    [TypModification]   TINYINT        CONSTRAINT [DF_Lms0_DosGroupeP_TypModification] DEFAULT ((0)) NOT NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [EstComplet]        BIT            NULL,
    CONSTRAINT [PK_Lms0_DosGroupeP] PRIMARY KEY CLUSTERED ([CleDosGroupeP] ASC),
    CONSTRAINT [FK1_Lms0_DosGroupeP] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms0_DosDossier] ([CleDossier])
);

