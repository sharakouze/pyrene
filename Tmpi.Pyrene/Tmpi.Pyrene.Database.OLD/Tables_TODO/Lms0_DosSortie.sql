CREATE TABLE [SA_TMPI].[Lms0_DosSortie] (
    [CleDosSortie]    INT      IDENTITY (1, 1) NOT NULL,
    [CleDossier]      INT      NOT NULL,
    [CleEtat]         SMALLINT NULL,
    [CleExport]       SMALLINT NULL,
    [CleDestinataire] INT      NULL,
    [NbrExemplaire]   TINYINT  NOT NULL,
    [TypTiers]        TINYINT  NULL,
    [CleMFeuille]     SMALLINT NULL,
    CONSTRAINT [FK1_Lms0_DosSortie] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms0_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms0_DosSortie] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat]),
    CONSTRAINT [UN_Lms0_DosSortie] UNIQUE NONCLUSTERED ([CleDossier] ASC, [CleMFeuille] ASC, [CleEtat] ASC, [CleExport] ASC, [TypTiers] ASC, [CleDestinataire] ASC)
);

