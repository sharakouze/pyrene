CREATE TABLE [SA_TMPI].[Lms_DosFacGroupeP] (
    [CleDossier]       INT             NOT NULL,
    [CleGroupeP]       INT             NOT NULL,
    [TypFacturation]   TINYINT         NOT NULL,
    [CleTarif]         SMALLINT        NOT NULL,
    [TauTVA]           DECIMAL (4, 2)  NOT NULL,
    [TauRemise]        DECIMAL (4, 2)  NOT NULL,
    [MntForfaitaire]   DECIMAL (10, 4) NULL,
    [EstMultiplie]     BIT             NOT NULL,
    [CleTarif_G]       INT             NOT NULL,
    [CleDosFacGroupeP] INT             IDENTITY (1, 1) NOT NULL,
    [TypArticle]       TINYINT         NOT NULL,
    CONSTRAINT [PK_Lms_DosFacGroupeP] PRIMARY KEY CLUSTERED ([CleDosFacGroupeP] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UN1_Lms_DosFacGroupeP]
    ON [SA_TMPI].[Lms_DosFacGroupeP]([CleDossier] ASC);

