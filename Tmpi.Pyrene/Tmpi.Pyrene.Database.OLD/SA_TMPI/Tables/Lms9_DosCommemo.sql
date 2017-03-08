CREATE TABLE [SA_TMPI].[Lms9_DosCommemo] (
    [CleDossier]        INT           NOT NULL,
    [ClePrelevement]    INT           NULL,
    [CleDosEchantillon] INT           NULL,
    [CleCommemo]        SMALLINT      NOT NULL,
    [ValResultat_N]     REAL          NULL,
    [NbrDecimale]       TINYINT       NULL,
    [ValResultat_A]     VARCHAR (255) NULL,
    [ValResultat_D]     SMALLDATETIME NULL,
    [ValResultat_L]     INT           NULL,
    [OpeResultat]       VARCHAR (10)  NULL,
    [EstObligatoire]    BIT           NOT NULL,
    [EstImprimable]     BIT           NOT NULL,
    [EstSaisi]          BIT           NOT NULL,
    [NumOrdre]          SMALLINT      NOT NULL,
    [EstExportable]     BIT           NOT NULL,
    [DatSaisie]         SMALLDATETIME NULL,
    [CleOperateur1]     SMALLINT      NULL,
    [CleOperateur2]     SMALLINT      NULL,
    [CleGroupeP]        SMALLINT      NULL,
    [CleDosCommemo]     INT           IDENTITY (1, 1) NOT NULL,
    [CleUniteT]         SMALLINT      NULL,
    [EstAccredite]      BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstAccredite] DEFAULT ((0)) NOT NULL,
    [EstFacturable]     BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstFacturable] DEFAULT ((0)) NOT NULL,
    [EstQteFacturee]    BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]     BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstPrxFacture] DEFAULT ((0)) NOT NULL,
    [EstHorsForfait]    BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstHorsForfait] DEFAULT ((0)) NOT NULL,
    [DatDebutAnalyse]   SMALLDATETIME NULL,
    [DatModification]   SMALLDATETIME NULL,
    [EstHorsFormat]     BIT           CONSTRAINT [DF_Lms9_DosCommemo_EstHorsFormat] DEFAULT ((0)) NOT NULL,
    [DatFinAnalyse]     SMALLDATETIME NULL,
    [CleProduit]        SMALLINT      NULL,
    CONSTRAINT [PK_Lm9_DosCommemo] PRIMARY KEY CLUSTERED ([CleDosCommemo] ASC),
    CONSTRAINT [FK1_Lms9_DosCommemo] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms9_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms9_DosCommemo] FOREIGN KEY ([CleDosEchantillon]) REFERENCES [SA_TMPI].[Lms9_DosEchantillon] ([CleDosEchantillon]),
    CONSTRAINT [FK3_Lms9_DosCommemo] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK4_Lms9_DosCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo]),
    CONSTRAINT [FK5_Lms9_DosCommemo] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK6_Lms9_DosCommemo] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lm9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lm9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([ClePrelevement] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lm9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleDosEchantillon] ASC);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleDosEchantillon] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lms9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleGroupeP] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Lms9_DosCommemo]
    ON [SA_TMPI].[Lms9_DosCommemo]([CleCommemo] ASC);

