CREATE TABLE [SA_TMPI].[Usr_MenuPerso] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CleProfil]   INT           NOT NULL,
    [CleMenu]     SMALLINT      NOT NULL,
    [LibMenu]     VARCHAR (100) NULL,
    [NumOrdre]    TINYINT       CONSTRAINT [DF_Usr_MenuPerso_NumOrdre] DEFAULT ((0)) NULL,
    [CodFamille]  VARCHAR (50)  NULL,
    CONSTRAINT [PK_Usr_MenuPerso] PRIMARY KEY CLUSTERED ([CleLogiciel] ASC, [CleProfil] ASC, [CleMenu] ASC)
);

