CREATE TABLE [SA_TMPI].[Usr_LogErreur] (
    [CleErreur]    INT           IDENTITY (1, 1) NOT NULL,
    [CleLogiciel]  TINYINT       NOT NULL,
    [CleOperateur] SMALLINT      NOT NULL,
    [NumVersion]   VARCHAR (20)  NOT NULL,
    [DatErreur]    SMALLDATETIME NOT NULL,
    [TxtErreur]    VARCHAR (500) NOT NULL,
    [CodPage]      VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Usr_LogErreur] PRIMARY KEY CLUSTERED ([CleErreur] ASC)
);

