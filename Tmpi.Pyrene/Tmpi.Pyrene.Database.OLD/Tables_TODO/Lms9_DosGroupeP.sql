CREATE TABLE [SA_TMPI].[Lms9_DosGroupeP] (
    [CleDossier]        INT            NOT NULL,
    [ClePrelevement]    INT            NULL,
    [CleDosEchantillon] INT            NOT NULL,
    [ClePrdGroupeP]     INT            NULL,
    [CleGroupeP]        INT            NOT NULL,
    [NumOrdre]          SMALLINT       NOT NULL,
    [CleInterpretation] SMALLINT       NULL,
    [TxtInterpretation] VARCHAR (2000) NULL,
    [NivTraitement]     TINYINT        NOT NULL,
    [TxtGroupeP]        VARCHAR (500)  NULL,
    [TypModification]   TINYINT        NOT NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [EstComplet]        BIT            NULL,
    [DatValidation]     SMALLDATETIME  NULL,
    [CleValideur]       SMALLINT       NULL,
    [CleDosGroupeP]     INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Lms9_DosGroupeP] PRIMARY KEY CLUSTERED ([CleDosGroupeP] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosGroupeP]
    ON [SA_TMPI].[Lms9_DosGroupeP]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms9_DosGroupeP]
    ON [SA_TMPI].[Lms9_DosGroupeP]([CleDosEchantillon] ASC);

