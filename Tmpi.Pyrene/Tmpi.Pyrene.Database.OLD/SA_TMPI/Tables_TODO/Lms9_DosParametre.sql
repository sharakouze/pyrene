CREATE TABLE [SA_TMPI].[Lms9_DosParametre] (
    [CleDossier]           INT             NOT NULL,
    [ClePrelevement]       INT             NULL,
    [CleDosEchantillon]    INT             NOT NULL,
    [CleGroupeP]           SMALLINT        NULL,
    [CleDosParametre]      INT             NOT NULL,
    [CleParametre]         INT             NULL,
    [CleMatrice]           SMALLINT        NULL,
    [OpeResultat]          VARCHAR (10)    NULL,
    [ValResultat_N]        REAL            NULL,
    [NbrDecimale]          TINYINT         NULL,
    [ValResultat_A]        VARCHAR (255)   NULL,
    [ValResultat_D]        SMALLDATETIME   NULL,
    [CleInterpretation]    SMALLINT        NULL,
    [DatDebutAnalyse]      SMALLDATETIME   NULL,
    [DatFinAnalyse]        SMALLDATETIME   NULL,
    [ValLimInferieure]     REAL            NULL,
    [ValLimSuperieure]     REAL            NULL,
    [ValLimDetection]      DECIMAL (15, 4) NULL,
    [ValLimQuantification] DECIMAL (15, 4) NULL,
    [ValLimSaturation]     DECIMAL (15, 4) NULL,
    [ValIncertitude]       DECIMAL (15, 4) NULL,
    [ValResultat_L]        INT             NULL,
    [EstSaisi]             BIT             NULL,
    [CleFeuille]           INT             NULL,
    [PrxUnitaire]          DECIMAL (10, 2) NULL,
    [CleLaboratoire]       INT             NULL,
    [EstAccredite]         BIT             NULL,
    [EstObligatoire]       BIT             NULL,
    [EstImprimable]        BIT             NULL,
    [EstExportable]        BIT             NULL,
    [EstFacturable]        BIT             NULL,
    [TxtMetBorne]          VARCHAR (100)   NULL,
    [TxtSpcBorne]          VARCHAR (100)   NULL,
    [CleSpcParametre]      INT             NULL,
    [CleSpecification]     SMALLINT        NULL,
    [NumOrdre]             SMALLINT        NULL,
    [DatSaisie]            SMALLDATETIME   NULL,
    [DatValidation]        SMALLDATETIME   NULL,
    [CleUniteT]            SMALLINT        NULL,
    [ClePrdGroupeP]        INT             NULL,
    [EstHorsForfait]       BIT             NOT NULL,
    [TypUsage]             VARCHAR (1)     NULL,
    [TxtIncertitude]       VARCHAR (100)   NULL,
    [EstHorsFormat]        BIT             CONSTRAINT [DF_Lms9_DosParametre_EstHorsFormat] DEFAULT ((0)) NOT NULL,
    [CleExpUnite]          SMALLINT        NULL,
    [TxtResultat]          VARCHAR (255)   NULL,
    [CleOperateur1]        SMALLINT        NULL,
    [CleOperateur2]        SMALLINT        NULL,
    [EstQteFacturee]       BIT             CONSTRAINT [DF_Lms9_DosParametre_EstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]        BIT             CONSTRAINT [DF_Lms9_DosParametre_EstPrxFacture] DEFAULT ((0)) NOT NULL,
    [DatModification]      SMALLDATETIME   NULL,
    [CleProduit]           SMALLINT        NULL,
    CONSTRAINT [PK_Lm9_DosParametre] PRIMARY KEY CLUSTERED ([CleDosParametre] ASC),
    CONSTRAINT [FK1_Lms9_DosParametre] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms9_DosDossier] ([CleDossier]),
    CONSTRAINT [FK10_Lms9_DosParametre] FOREIGN KEY ([CleInterpretation]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [FK2_Lms9_DosParametre] FOREIGN KEY ([CleDosEchantillon]) REFERENCES [SA_TMPI].[Lms9_DosEchantillon] ([CleDosEchantillon]),
    CONSTRAINT [FK3_Lms9_DosParametre] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK4_Lms9_DosParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK5_Lms9_DosParametre] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK6_Lms9_DosParametre] FOREIGN KEY ([CleSpecification]) REFERENCES [SA_TMPI].[Lmp_SpcSpecification] ([CleSpecification]),
    CONSTRAINT [FK7_Lms9_DosParametre] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [FK8_Lms9_DosParametre] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK9_Lms9_DosParametre] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosParametre]
    ON [SA_TMPI].[Lms9_DosParametre]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms9_DosParametre]
    ON [SA_TMPI].[Lms9_DosParametre]([CleDosEchantillon] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lms9_DosParametre]
    ON [SA_TMPI].[Lms9_DosParametre]([CleGroupeP] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Lms9_DosParametre]
    ON [SA_TMPI].[Lms9_DosParametre]([CleParametre] ASC);

