CREATE TABLE [SA_TMPI].[Lms_DosPayeur] (
    [CleDossier]      INT           NOT NULL,
    [ClePayeur]       INT           NOT NULL,
    [TypPayeur]       TINYINT       NOT NULL,
    [DatEcheance]     SMALLDATETIME NULL,
    [DatFacturation]  SMALLDATETIME NULL,
    [TypEcheanceFact] TINYINT       CONSTRAINT [DF_Lms_DosPayeur_TypEcheanceFact] DEFAULT ((0)) NOT NULL,
    [CleFacture]      INT           NULL,
    CONSTRAINT [UN_Lms_DosPayeur] PRIMARY KEY CLUSTERED ([CleDossier] ASC, [ClePayeur] ASC),
    CONSTRAINT [FK1_Lms_DosPayeur] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms_DosPayeur] FOREIGN KEY ([ClePayeur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lms_DosPayeur]
    ON [SA_TMPI].[Lms_DosPayeur]([CleDossier] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lms_DosPayeur]
    ON [SA_TMPI].[Lms_DosPayeur]([ClePayeur] ASC);

