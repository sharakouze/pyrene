CREATE TABLE [Gen].[Personne]
(
    [ClePersonne] INT NOT NULL IDENTITY,
    [CodPersonne] VARCHAR(100) NOT NULL,
    [NomPersonne] VARCHAR(100) NOT NULL,
    [PrePersonne] VARCHAR(100) NULL,
    [TxtPersonne] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypCivilite] INT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_Personne] PRIMARY KEY ([ClePersonne]),
    CONSTRAINT [UK_Personne_CodPersonne] UNIQUE ([CodPersonne])
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de famille.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Personne',
    @level2type = N'COLUMN',
    @level2name = N'NomPersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Prénom.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Personne',
    @level2type = N'COLUMN',
    @level2name = N'PrePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Titre de civilité.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Personne',
    @level2type = N'COLUMN',
    @level2name = 'TypCivilite'