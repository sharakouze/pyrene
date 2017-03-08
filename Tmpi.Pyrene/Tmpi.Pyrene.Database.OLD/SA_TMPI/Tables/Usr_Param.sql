CREATE TABLE [SA_TMPI].[Usr_Param] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CleParam]    TINYINT       NOT NULL,
    [ValParam]    VARCHAR (500) NULL,
    CONSTRAINT [PK_Usr_Param] PRIMARY KEY CLUSTERED ([CleLogiciel] ASC, [CleParam] ASC)
);

