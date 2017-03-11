CREATE TABLE [Gen].[TypeIdent]
(
    [Id] INT NOT NULL IDENTITY,
    [CodTypeIdent] VARCHAR (100) NOT NULL,
    [LibTypeIdent] VARCHAR (200) NOT NULL,
    [TxtTypeIdent] VARCHAR (2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NULL,
    [CodExterne] VARCHAR(100) NULL,
    CONSTRAINT [PK_TypeIdent] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_TypeIdent_CodTypeIdent] UNIQUE ([CodTypeIdent])
);
