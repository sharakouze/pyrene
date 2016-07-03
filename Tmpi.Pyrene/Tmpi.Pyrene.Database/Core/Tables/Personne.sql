CREATE TABLE [Core].[Personne]
(
	[ClePersonne] INT NOT NULL IDENTITY,
    [CodPersonne] VARCHAR(50) NOT NULL,
    [PrePersonne] VARCHAR(50) NULL,
    [NomPersonne] VARCHAR(50) NOT NULL,
    [TxtPersonne] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
	[IdExterne] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_Personne] PRIMARY KEY ([ClePersonne]),
    CONSTRAINT [UN_Personne_CodPersonne] UNIQUE ([CodPersonne])
);

GO

CREATE INDEX [IX_Personne_NomPersonne] ON [Core].[Personne] ([NomPersonne]);
