CREATE TABLE [Gen].[CiviliteTiers]
(
	[Id] INT NOT NULL IDENTITY,
	[CodCiviliteTiers] VARCHAR(100) NOT NULL,
	[LibCiviliteTiers] VARCHAR(200) NOT NULL,
	[TxtCiviliteTiers] VARCHAR(2000) NULL,
	[EstActif] BIT NOT NULL,
	[DatCreation] DATETIME NOT NULL,
	[DatModif] DATETIME NULL,
	[CodExterne] VARCHAR(100) NULL,
	CONSTRAINT [PK_CiviliteTiers] PRIMARY KEY ([Id]),
	CONSTRAINT [UK_CiviliteTiers_CodCiviliteTiers] UNIQUE ([CodCiviliteTiers])
);
