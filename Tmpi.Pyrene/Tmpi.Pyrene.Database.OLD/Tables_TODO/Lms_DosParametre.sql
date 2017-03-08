CREATE TABLE [SA_TMPI].[Lms_DosParametre] (
    [CleDossier]           INT             NOT NULL,
    [ClePrelevement]       INT             NULL,
    [CleDosEchantillon]    INT             NOT NULL,
    [CleGroupeP]           SMALLINT        NULL,
    [CleDosParametre]      INT             IDENTITY (1, 1) NOT NULL,
    [CleParametre]         INT             NULL,
    [CleMatrice]           SMALLINT        NULL,
    [CleLaboratoire]       INT             NULL,
    [CleSpecification]     SMALLINT        NULL,
    [CleSpcParametre]      INT             NULL,
    [DatDebutAnalyse]      SMALLDATETIME   NULL,
    [DatFinAnalyse]        SMALLDATETIME   NULL,
    [OpeResultat]          VARCHAR (10)    NULL,
    [ValResultat_N]        REAL            NULL,
    [NbrDecimale]          TINYINT         NULL,
    [ValResultat_A]        VARCHAR (255)   NULL,
    [ValResultat_D]        SMALLDATETIME   NULL,
    [ValResultat_L]        INT             NULL,
    [CleInterpretation]    SMALLINT        NULL,
    [ValLimInferieure]     REAL            NULL,
    [ValLimSuperieure]     REAL            NULL,
    [ValLimDetection]      DECIMAL (15, 4) NULL,
    [ValLimQuantification] DECIMAL (15, 4) NULL,
    [ValLimSaturation]     DECIMAL (15, 4) NULL,
    [ValIncertitude]       DECIMAL (15, 4) NULL,
    [TxtMetBorne]          VARCHAR (100)   NULL,
    [TxtSpcBorne]          VARCHAR (100)   NULL,
    [CleFeuille]           INT             NULL,
    [EstAccredite]         BIT             CONSTRAINT [DF_Lms_DosParametre_EstAccredite] DEFAULT ((0)) NOT NULL,
    [EstObligatoire]       BIT             CONSTRAINT [DF_Lms_DosParametre_EstObligatoire] DEFAULT ((0)) NULL,
    [NumOrdre]             SMALLINT        NULL,
    [EstImprimable]        BIT             CONSTRAINT [DF_Lms_DosParametre_EstImprimable] DEFAULT ((1)) NULL,
    [EstExportable]        BIT             CONSTRAINT [DF_Lms_DosParametre_EstExportable] DEFAULT ((1)) NULL,
    [EstFacturable]        BIT             CONSTRAINT [DF_Lms_DosParametre_EstFacturable] DEFAULT ((1)) NULL,
    [PrxUnitaire]          DECIMAL (10, 2) NULL,
    [EstSaisi]             BIT             CONSTRAINT [DF_Lms_DosParametre_EstSaisi] DEFAULT ((0)) NOT NULL,
    [DatSaisie]            SMALLDATETIME   NULL,
    [DatValidation]        SMALLDATETIME   NULL,
    [CleUniteT]            SMALLINT        NULL,
    [ClePrdGroupeP]        INT             NULL,
    [EstHorsForfait]       BIT             CONSTRAINT [DF_Lms_DosParametre_EstHorsForfait] DEFAULT ((0)) NOT NULL,
    [TypUsage]             VARCHAR (1)     NULL,
    [TxtIncertitude]       VARCHAR (100)   NULL,
    [EstHorsFormat]        BIT             CONSTRAINT [DF_Lms_DosParametre_EstHorsFormat] DEFAULT ((0)) NOT NULL,
    [TxtResultat]          VARCHAR (255)   NULL,
    [CleExpUnite]          INT             NULL,
    [CleOperateur1]        SMALLINT        NULL,
    [CleOperateur2]        SMALLINT        NULL,
    [EstQteFacturee]       BIT             CONSTRAINT [DF_Lms_DosParametre_EstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]        BIT             CONSTRAINT [DF_Lms_DosParametre_EstPrxFacture] DEFAULT ((0)) NOT NULL,
    [DatModification]      SMALLDATETIME   NULL,
    [CleProduit]           SMALLINT        NULL,
    CONSTRAINT [PK_Lms_DosParametre] PRIMARY KEY CLUSTERED ([CleDosParametre] ASC),
    CONSTRAINT [FK1_Lms_DosParametre] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier]),
    CONSTRAINT [FK10_Lms_DosParametre] FOREIGN KEY ([CleInterpretation]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [FK11_Lms_DosParametre] FOREIGN KEY ([CleFeuille]) REFERENCES [SA_TMPI].[Lms_FeuFeuille] ([CleFeuille]),
    CONSTRAINT [FK2_Lms_DosParametre] FOREIGN KEY ([CleDosEchantillon]) REFERENCES [SA_TMPI].[Lms_DosEchantillon] ([CleDosEchantillon]),
    CONSTRAINT [FK3_Lms_DosParametre] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK4_Lms_DosParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK5_Lms_DosParametre] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK6_Lms_DosParametre] FOREIGN KEY ([CleSpecification]) REFERENCES [SA_TMPI].[Lmp_SpcSpecification] ([CleSpecification]),
    CONSTRAINT [FK7_Lms_DosParametre] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [FK8_Lms_DosParametre] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK9_Lms_DosParametre] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms_DosParametre]
    ON [SA_TMPI].[Lms_DosParametre]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms_DosParametre]
    ON [SA_TMPI].[Lms_DosParametre]([CleDosEchantillon] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lms_DosParametre]
    ON [SA_TMPI].[Lms_DosParametre]([CleGroupeP] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Lms_DosParametre]
    ON [SA_TMPI].[Lms_DosParametre]([CleParametre] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Lms_DosParametre]
    ON [SA_TMPI].[Lms_DosParametre]([CleFeuille] ASC);

