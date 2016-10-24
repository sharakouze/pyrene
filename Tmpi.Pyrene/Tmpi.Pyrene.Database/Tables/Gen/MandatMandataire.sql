CREATE TABLE [Gen].[MandatMandataire]
(
    [CleMandataire] INT IDENTITY NOT NULL,
    [CleMandat] INT NOT NULL,
    [ClePersonne] INT NOT NULL,
    [CleService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    CONSTRAINT [PK_MandatMandataire] PRIMARY KEY ([CleMandataire]),
    CONSTRAINT [UK_MandatMandataire_CleMandat_ClePersonne_CleService] UNIQUE ([CleMandat], [ClePersonne], [CleService]),
    CONSTRAINT [FK_MandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [Gen].[Mandat] ([CleMandat]) ON DELETE CASCADE,
    CONSTRAINT [FK_MandatMandataire_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Gen].[Personne] ([ClePersonne]),
    CONSTRAINT [FK_MandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [Gen].[Service] ([CleService]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du mandat parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleMandat'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur mandataire.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'ClePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service ayant accès au mandat, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleService'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, le mandat est suspendu.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'MandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'EstSuspendu'