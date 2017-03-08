CREATE TABLE [SA_TMPI].[Usr_StoMaintenance] (
    [DatTraitement] SMALLDATETIME   NOT NULL,
    [CleMagasin]    SMALLINT        NOT NULL,
    [CleArticle]    INT             NOT NULL,
    [TypCorrection] VARCHAR (25)    NOT NULL,
    [QteAvant]      DECIMAL (15, 3) NULL,
    [QteApres]      DECIMAL (15, 3) NULL
);

