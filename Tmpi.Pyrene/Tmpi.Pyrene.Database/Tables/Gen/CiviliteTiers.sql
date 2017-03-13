CREATE TABLE [Gen].[CiviliteTiers]
(
	[Id] INT NOT NULL IDENTITY,
	[CodObjet] VARCHAR(100) NOT NULL,
	[LibObjet] VARCHAR(200) NOT NULL,
	[TxtObjet] VARCHAR(2000) NULL,
	[EstActif] BIT NOT NULL,
	[DatCreation] DATETIME NOT NULL,
	[DatModif] DATETIME NOT NULL,
	[CodExterne] VARCHAR(100) NULL,
	CONSTRAINT [PK_CiviliteTiers] PRIMARY KEY ([Id]),
	CONSTRAINT [UK_CiviliteTiers_CodObjet] UNIQUE ([CodObjet])
);
