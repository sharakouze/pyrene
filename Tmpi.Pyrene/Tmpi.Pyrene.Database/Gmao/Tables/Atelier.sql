CREATE TABLE [Gmao].[Atelier]
(
	[CleAtelier] INT NOT NULL IDENTITY, 
    [CodAtelier] VARCHAR(100) NOT NULL,
    [LibAtelier] VARCHAR(200) NOT NULL,
    [TxtAtelier] VARCHAR(500) NULL, 
    [EstActif] BIT NOT NULL, 
    [DatCreation] DATETIME NOT NULL, 
    [DatModif] DATETIME NOT NULL,
	[IdExterne] VARCHAR(100) NULL,
	CONSTRAINT [PK_Atelier] PRIMARY KEY ([CleAtelier]), 
    CONSTRAINT [UN_Atelier_CodAtelier] UNIQUE ([CodAtelier]),
)
GO

CREATE INDEX [IX_Atelier_LibAtelier] ON [Gmao].[Atelier] ([LibAtelier])
