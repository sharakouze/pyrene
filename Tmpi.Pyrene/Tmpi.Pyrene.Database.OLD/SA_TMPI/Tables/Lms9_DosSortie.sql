CREATE TABLE [SA_TMPI].[Lms9_DosSortie] (
    [CleDosSortie]    INT      NULL,
    [CleDossier]      INT      NOT NULL,
    [CleEtat]         SMALLINT NULL,
    [CleExport]       SMALLINT NULL,
    [CleDestinataire] INT      NULL,
    [NbrExemplaire]   TINYINT  NOT NULL,
    [TypTiers]        TINYINT  NULL,
    [CleMFeuille]     SMALLINT NULL,
    CONSTRAINT [FK1_Lm9_DosSortie] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms9_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lm9_DosSortie] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms9_DosSortie]
    ON [SA_TMPI].[Lms9_DosSortie]([CleDossier] ASC);

