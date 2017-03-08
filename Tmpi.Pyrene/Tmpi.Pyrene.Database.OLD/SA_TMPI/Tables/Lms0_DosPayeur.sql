CREATE TABLE [SA_TMPI].[Lms0_DosPayeur] (
    [CleDossier]      INT           NOT NULL,
    [ClePayeur]       INT           NOT NULL,
    [TypPayeur]       TINYINT       NOT NULL,
    [DatEcheance]     SMALLDATETIME NULL,
    [DatFacturation]  SMALLDATETIME NULL,
    [TypEcheanceFact] TINYINT       CONSTRAINT [DF_Lms0_DosPayeur_TypEcheanceFact] DEFAULT ((0)) NOT NULL,
    [CleFacture]      INT           NULL,
    CONSTRAINT [UN_Lms0_DosPayeur] PRIMARY KEY CLUSTERED ([CleDossier] ASC, [ClePayeur] ASC),
    CONSTRAINT [FK1_Lms0_DosPayeur] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms0_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms0_DosPayeur] FOREIGN KEY ([ClePayeur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers])
);

