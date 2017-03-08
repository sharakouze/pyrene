CREATE TABLE [SA_TMPI].[Usr_Menu] (
    [CleMenu]    SMALLINT      NOT NULL,
    [CodFamille] VARCHAR (50)  NULL,
    [NumOrdre]   TINYINT       NULL,
    [LibMenu]    VARCHAR (100) NULL,
    CONSTRAINT [PK_Usr_Menu] PRIMARY KEY CLUSTERED ([CleMenu] ASC)
);

