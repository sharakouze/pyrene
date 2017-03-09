CREATE TABLE [Gen].[CiviliteTiers]
(
	[CleCiviliteTiers] INT NOT NULL IDENTITY,
    [CodCiviliteTiers] VARCHAR(100) NOT NULL,
    [LibCiviliteTiers] VARCHAR(200) NOT NULL,
    [TxtCiviliteTiers] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    CONSTRAINT [PK_CiviliteTiers] PRIMARY KEY ([CleCiviliteTiers]),
    CONSTRAINT [UK_CiviliteTiers_CodCiviliteTiers] UNIQUE ([CodCiviliteTiers])
);
