CREATE TABLE [SA_TMPI].[Usr_LogTrace] (
    [CleLogiciel]      TINYINT        NOT NULL,
    [CleTable]         SMALLINT       NOT NULL,
    [CleOperateur]     SMALLINT       NOT NULL,
    [CleObjet1]        INT            NOT NULL,
    [CleObjet2]        INT            NULL,
    [CodChamp]         VARCHAR (50)   NOT NULL,
    [ValAvant]         VARCHAR (255)  NULL,
    [ValApres]         VARCHAR (255)  NULL,
    [DatSaisie]        SMALLDATETIME  NOT NULL,
    [TxtJustification] VARCHAR (2000) NULL,
    [CleTrace]         INT            IDENTITY (1, 1) NOT NULL
);

