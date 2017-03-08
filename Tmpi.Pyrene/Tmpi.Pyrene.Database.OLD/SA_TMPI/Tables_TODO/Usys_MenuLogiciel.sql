CREATE TABLE [SA_TMPI].[Usys_MenuLogiciel] (
    [CleLogiciel] TINYINT  NOT NULL,
    [CleMenu]     SMALLINT NOT NULL,
    CONSTRAINT [PK_Usys_MenuLogiciel] PRIMARY KEY CLUSTERED ([CleLogiciel] ASC, [CleMenu] ASC)
);

