CREATE TABLE [Gen].[PersonneProfil]
(
    [CleProfil] INT NOT NULL IDENTITY,
    [ClePersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NULL,
    [CleService] INT NULL,
    CONSTRAINT [PK_PersonneProfil] PRIMARY KEY ([CleProfil]), 
    CONSTRAINT [UK_PersonneProfil_CodProfil_ClePersonne] UNIQUE ([CodProfil], [ClePersonne]), 
    CONSTRAINT [UK_PersonneProfil_ClePersonne_CleService] UNIQUE ([ClePersonne], [CleService]),
    CONSTRAINT [FK_PersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Gen].[Personne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_PersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [Gen].[Service] ([CleService]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'ClePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service auquel a accès le profil, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'CleService'