CREATE TABLE [Gen].[PersonneProfil]
(
    [Id] INT NOT NULL IDENTITY,
    [PersonneId] INT NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [ServiceId] INT NULL,
    CONSTRAINT [PK_PersonneProfil] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_PersonneProfil_CodObjet_PersonneId] UNIQUE ([CodObjet], [PersonneId]), 
    CONSTRAINT [UK_PersonneProfil_PersonneId_ServiceId] UNIQUE ([PersonneId], [ServiceId]),
    CONSTRAINT [FK_PersonneProfil_PersonneId] FOREIGN KEY ([PersonneId]) REFERENCES [Gen].[Personne] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PersonneProfil_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [Gen].[Service] ([Id]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'PersonneId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service auquel a accès le profil, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneProfil',
    @level2type = N'COLUMN',
    @level2name = 'ServiceId'