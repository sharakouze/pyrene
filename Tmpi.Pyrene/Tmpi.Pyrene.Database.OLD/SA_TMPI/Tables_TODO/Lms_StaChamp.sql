CREATE TABLE [SA_TMPI].[Lms_StaChamp] (
    [TypMStats] TINYINT       NOT NULL,
    [CleChamp]  SMALLINT      NOT NULL,
    [NumOrdre1] TINYINT       NOT NULL,
    [NumOrdre2] TINYINT       NOT NULL,
    [CodChamp]  VARCHAR (200) NOT NULL,
    [LibChamp]  VARCHAR (100) NOT NULL,
    [TxtAlias]  VARCHAR (100) NULL,
    [TxtFrom]   VARCHAR (255) NOT NULL,
    [FrmChamp]  TINYINT       NOT NULL,
    [NivStat]   TINYINT       NOT NULL,
    CONSTRAINT [PK_Lms_StaChamp] PRIMARY KEY CLUSTERED ([CleChamp] ASC)
);

