CREATE TABLE [Gen].[MandatMandataire]
(
    [Id] INT IDENTITY NOT NULL,
    [MandatId] INT NOT NULL,
    [PersonneId] INT NOT NULL,
    [ServiceId] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_MandatMandataire] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_MandatMandataire_MandatId_PersonneId_ServiceId] UNIQUE ([MandatId], [PersonneId], [ServiceId]),
    CONSTRAINT [FK_MandatMandataire_MandatId] FOREIGN KEY ([MandatId]) REFERENCES [Gen].[Mandat] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_MandatMandataire_PersonneId] FOREIGN KEY ([PersonneId]) REFERENCES [Gen].[Personne] ([Id]),
    CONSTRAINT [FK_MandatMandataire_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [Gen].[Service] ([Id]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du mandat parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'MandatId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur mandataire.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'PersonneId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service ayant accès au mandat, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'ServiceId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, le mandat est suspendu.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'EstSuspendu'