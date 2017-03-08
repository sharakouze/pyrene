CREATE TABLE [SA_TMPI].[Lms_DosEchantillon] (
    [CleDossier]         INT           NOT NULL,
    [ClePrelevement]     INT           NULL,
    [CleDosEchantillon]  INT           IDENTITY (1, 1) NOT NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon_Int] VARCHAR (25)  NOT NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [NumEtiquette]       VARCHAR (100) NULL,
    [LibEchantillon]     VARCHAR (200) NULL,
    [TxtEchantillon]     VARCHAR (500) NULL,
    [CleMatrice]         SMALLINT      NULL,
    [CleProduit]         SMALLINT      NOT NULL,
    [CleSpecification]   SMALLINT      NULL,
    [DatPrelevement]     SMALLDATETIME NULL,
    [DatReception]       SMALLDATETIME NULL,
    [DatDebutAnalyse]    SMALLDATETIME NULL,
    [DatFinAnalyse]      SMALLDATETIME NULL,
    [CleCauseNA]         SMALLINT      NULL,
    [DatModification]    SMALLDATETIME NULL,
    [CleOperateur]       SMALLINT      NULL,
    [DatValidation]      SMALLDATETIME NULL,
    [CleValideur]        SMALLINT      NULL,
    [TypPoint]           TINYINT       CONSTRAINT [DF_Lms_DosEchantillon_TypPoint] DEFAULT ((1)) NOT NULL,
    [NumPoint]           VARCHAR (50)  NULL,
    [NomPoint]           VARCHAR (200) NULL,
    [AdrPoint]           VARCHAR (500) NULL,
    [CleClasse]          SMALLINT      NULL,
    [CleSerEchantillon]  INT           NULL,
    [NbrEtiquette]       TINYINT       NULL,
    [NumLot]             SMALLINT      NULL,
    [NumPointS]          VARCHAR (50)  NULL,
    [NomPointS]          VARCHAR (100) NULL,
    [CleDemEchantillon]  INT           NULL,
    [NivTraitement]      TINYINT       CONSTRAINT [DF_Lms_DosEchantillon_NivTraitement] DEFAULT ((0)) NOT NULL,
    [CleInterpretation]  SMALLINT      NULL,
    [NbrEchantillon]     SMALLINT      NULL,
    [TypIdentPP]         TINYINT       NULL,
    [NumPointP]          VARCHAR (50)  NULL,
    [NomPointP]          VARCHAR (100) NULL,
    [TypIdentPS]         TINYINT       NULL,
    CONSTRAINT [PK_Lms_DosEchantillon] PRIMARY KEY CLUSTERED ([CleDosEchantillon] ASC),
    CONSTRAINT [FK1_Lms_DosEchantillon] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms_DosEchantillon] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK3_Lms_DosEchantillon] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [FK4_Lms_DosEchantillon] FOREIGN KEY ([CleSpecification]) REFERENCES [SA_TMPI].[Lmp_SpcSpecification] ([CleSpecification])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms_DosEchantillon]
    ON [SA_TMPI].[Lms_DosEchantillon]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms_DosEchantillon]
    ON [SA_TMPI].[Lms_DosEchantillon]([ClePrelevement] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lms_DosEchantillon]
    ON [SA_TMPI].[Lms_DosEchantillon]([NumEchantillon_Int] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Lms_DosEchantillon]
    ON [SA_TMPI].[Lms_DosEchantillon]([NumEchantillon_Ext] ASC);

