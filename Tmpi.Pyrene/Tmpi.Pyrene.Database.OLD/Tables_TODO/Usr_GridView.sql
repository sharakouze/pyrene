CREATE TABLE [SA_TMPI].[Usr_GridView] (
    [CodPage]     VARCHAR (50) NOT NULL,
    [NomGridView] VARCHAR (50) NOT NULL,
    [CodChamp]    VARCHAR (50) NOT NULL,
    [EstVisible]  BIT          NOT NULL,
    CONSTRAINT [PK_Usr_GridView] PRIMARY KEY CLUSTERED ([CodPage] ASC, [NomGridView] ASC, [CodChamp] ASC)
);

