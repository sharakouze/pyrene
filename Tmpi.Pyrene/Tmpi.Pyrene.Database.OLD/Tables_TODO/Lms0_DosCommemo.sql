CREATE TABLE [SA_TMPI].[Lms0_DosCommemo] (
    [CleDossier]        INT           NOT NULL,
    [ClePrelevement]    INT           NOT NULL,
    [CleDosEchantillon] INT           NOT NULL,
    [CleDosCommemo]     INT           IDENTITY (1, 1) NOT NULL,
    [CleCommemo]        SMALLINT      NOT NULL,
    [OpeResultat]       VARCHAR (10)  NULL,
    [ValResultat_N]     REAL          NULL,
    [NbrDecimale]       TINYINT       NULL,
    [ValResultat_A]     VARCHAR (255) NULL,
    [ValResultat_D]     SMALLDATETIME NULL,
    [ValResultat_L]     INT           NULL,
    [EstObligatoire]    BIT           NOT NULL,
    [EstImprimable]     BIT           NOT NULL,
    [EstSaisi]          BIT           NOT NULL,
    [NumOrdre]          SMALLINT      NOT NULL,
    [EstExportable]     BIT           NOT NULL,
    [CleDosParametre]   INT           NULL,
    [CleGroupeP]        SMALLINT      NULL,
    CONSTRAINT [PK_Lms0_DosCommemo] PRIMARY KEY CLUSTERED ([CleDosCommemo] ASC),
    CONSTRAINT [FK1_Lms0_DosCommemo] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms0_DosDossier] ([CleDossier]),
    CONSTRAINT [FK3_Lms0_DosCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo])
);

