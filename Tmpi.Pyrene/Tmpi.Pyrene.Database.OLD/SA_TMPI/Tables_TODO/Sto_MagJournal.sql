CREATE TABLE [SA_TMPI].[Sto_MagJournal] (
    [CleMagasin]    SMALLINT        NOT NULL,
    [CleMouvement]  INT             IDENTITY (1, 1) NOT NULL,
    [TypMouvement]  TINYINT         NOT NULL,
    [DatMouvement]  SMALLDATETIME   CONSTRAINT [DF_Sto_MagJournal_DatMouvement] DEFAULT (getdate()) NOT NULL,
    [CleCommande]   INT             NULL,
    [CleArticle]    INT             NOT NULL,
    [CleFouArticle] INT             NOT NULL,
    [QteCommandee]  DECIMAL (15, 3) NOT NULL,
    [CleProfil]     INT             NOT NULL,
    [CleDemande]    INT             NULL
);

