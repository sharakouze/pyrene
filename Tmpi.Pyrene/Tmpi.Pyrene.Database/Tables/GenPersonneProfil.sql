CREATE TABLE [GenPersonneProfil]
(
    [CleProfil] INT NOT NULL IDENTITY,
    [ClePersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([CleProfil]), 
    CONSTRAINT [UK_GenPersonneProfil_CodProfil_ClePersonne] UNIQUE ([CodProfil], [ClePersonne]), 
    CONSTRAINT [UK_GenPersonneProfil_ClePersonne_CleSociete_CleSecteur_CleService] UNIQUE ([ClePersonne], [CleSociete], [CleSecteur], [CleService]),
    CONSTRAINT [FK_GenPersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]),
    CONSTRAINT [FK_GenPersonneProfil_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSecteur] ([CleSecteur]),
    CONSTRAINT [FK_GenPersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenService] ([CleService]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'ClePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Société à laquelle a accès le profil, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'CleSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Secteur auquel a accès le profil, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'CleSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Service auquel a accès le profil, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'CleService'