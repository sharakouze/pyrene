CREATE TABLE [SA_TMPI].[USys_Menu] (
    [CleMenu]     SMALLINT      NOT NULL,
    [CleLogiciel] TINYINT       NOT NULL,
    [CodFamille]  VARCHAR (50)  NULL,
    [NumOrdre]    TINYINT       NOT NULL,
    [LibMenu]     VARCHAR (100) NULL,
    [CodPage]     VARCHAR (100) NOT NULL,
    [TxtSql]      VARCHAR (200) NULL,
    CONSTRAINT [PK_Usys_Menu] PRIMARY KEY CLUSTERED ([CleMenu] ASC),
    CONSTRAINT [UN1_Usys_Menu] UNIQUE NONCLUSTERED ([CodPage] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_USys_Menu]
    ON [SA_TMPI].[USys_Menu]([CleLogiciel] ASC);

