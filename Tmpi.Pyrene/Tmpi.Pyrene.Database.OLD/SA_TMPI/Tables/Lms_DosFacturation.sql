CREATE TABLE [SA_TMPI].[Lms_DosFacturation] (
    [CleDossier]        INT             NOT NULL,
    [CleDosFacturation] INT             IDENTITY (1, 1) NOT NULL,
    [TypArticle]        TINYINT         NULL,
    [CleTarif]          SMALLINT        NULL,
    [CleArticle]        INT             NOT NULL,
    [EstFacturable]     BIT             NULL,
    [EstForfaitaire]    BIT             NULL,
    [PrxUnitaire]       DECIMAL (10, 3) NULL,
    [TauRemise]         DECIMAL (4, 2)  NULL,
    [TauTVA]            DECIMAL (4, 2)  NULL,
    [EstSansTarif]      BIT             NULL,
    [EstVerrouille]     BIT             NULL,
    [CleTarArticle]     INT             NULL,
    CONSTRAINT [FK1_Lms_DosFacturation] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier])
);

