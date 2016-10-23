CREATE TABLE [GenPersonneProfil]
(
    [CleProfil] INT NOT NULL IDENTITY,
    [ClePersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CleService] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([CleProfil]), 
    CONSTRAINT [UK_GenPersonneProfil_CodProfil_ClePersonne] UNIQUE ([CodProfil], [ClePersonne]), 
    CONSTRAINT [UK_GenPersonneProfil_ClePersonne_CleService] UNIQUE ([ClePersonne], [CleService]),
    CONSTRAINT [FK_GenPersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenService] ([CleService]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'ClePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service auquel a accès le profil, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'CleService'