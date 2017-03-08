CREATE TABLE [SA_TMPI].[USys_Lms_SttChamp] (
    [TypMStats] TINYINT       NOT NULL,
    [CleChamp]  SMALLINT      NOT NULL,
    [NumOrdre1] TINYINT       NOT NULL,
    [NumOrdre2] TINYINT       NOT NULL,
    [CodChamp]  VARCHAR (200) NOT NULL,
    [LibChamp]  VARCHAR (100) NOT NULL,
    [TxtAlias]  VARCHAR (100) NULL,
    [TxtFrom]   VARCHAR (255) NULL,
    [FrmChamp]  TINYINT       NOT NULL,
    [NivStat]   TINYINT       NOT NULL,
    CONSTRAINT [PK_USys_Lms_SttChamp] PRIMARY KEY CLUSTERED ([CleChamp] ASC)
);

