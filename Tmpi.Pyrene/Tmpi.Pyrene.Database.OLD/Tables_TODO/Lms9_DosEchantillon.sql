CREATE TABLE [SA_TMPI].[Lms9_DosEchantillon] (
    [CleDossier]         INT           NOT NULL,
    [ClePrelevement]     INT           NULL,
    [CleDosEchantillon]  INT           NOT NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon_Int] VARCHAR (25)  NOT NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [NumEtiquette]       VARCHAR (100) NULL,
    [LibEchantillon]     VARCHAR (200) NULL,
    [TxtEchantillon]     VARCHAR (500) NULL,
    [DatPrelevement]     SMALLDATETIME NULL,
    [DatReception]       SMALLDATETIME NULL,
    [CleMatrice]         SMALLINT      NULL,
    [CleProduit]         SMALLINT      NOT NULL,
    [DatDebutAnalyse]    SMALLDATETIME NULL,
    [DatFinAnalyse]      SMALLDATETIME NULL,
    [CleCauseNA]         SMALLINT      NULL,
    [DatModification]    SMALLDATETIME NULL,
    [CleOperateur]       SMALLINT      NULL,
    [DatValidation]      SMALLDATETIME NULL,
    [CleValideur]        SMALLINT      NULL,
    [CleSpecification]   SMALLINT      NULL,
    [TypPoint]           TINYINT       NOT NULL,
    [NumPoint]           VARCHAR (50)  NULL,
    [NomPoint]           VARCHAR (200) NULL,
    [AdrPoint]           VARCHAR (500) NULL,
    [CleClasse]          SMALLINT      NULL,
    [NbrEtiquette]       TINYINT       NULL,
    [CleSerEchantillon]  INT           NULL,
    [NomPointS]          VARCHAR (100) NULL,
    [NumPointS]          VARCHAR (50)  NULL,
    [NumLot]             SMALLINT      NULL,
    [CleDemEchantillon]  INT           NULL,
    [NivTraitement]      TINYINT       CONSTRAINT [DF_Lms9_DosEchantillon_NivTraitement] DEFAULT ((0)) NOT NULL,
    [CleInterpretation]  SMALLINT      NULL,
    [TypIdentPP]         TINYINT       NULL,
    [NumPointP]          VARCHAR (50)  NULL,
    [NomPointP]          VARCHAR (100) NULL,
    [TypIdentPS]         TINYINT       NULL,
    [NbrEchantillon]     SMALLINT      NULL,
    CONSTRAINT [PK_Lm9_DosEchantillon] PRIMARY KEY CLUSTERED ([CleDosEchantillon] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lm9_DosEchantillon]
    ON [SA_TMPI].[Lms9_DosEchantillon]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lm9_DosEchantillon]
    ON [SA_TMPI].[Lms9_DosEchantillon]([ClePrelevement] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lm9_DosEchantillon]
    ON [SA_TMPI].[Lms9_DosEchantillon]([NumEchantillon_Int] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Lm9_DosEchantillon]
    ON [SA_TMPI].[Lms9_DosEchantillon]([NumEchantillon_Ext] ASC);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosEchantillon]
    ON [SA_TMPI].[Lms9_DosEchantillon]([CleDossier] ASC);

