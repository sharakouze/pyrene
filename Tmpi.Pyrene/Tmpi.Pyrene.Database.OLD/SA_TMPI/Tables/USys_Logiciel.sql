CREATE TABLE [SA_TMPI].[USys_Logiciel] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CodLogiciel] VARCHAR (50)  NOT NULL,
    [LibLogiciel] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_USys_Logiciel] PRIMARY KEY CLUSTERED ([CleLogiciel] ASC)
);

