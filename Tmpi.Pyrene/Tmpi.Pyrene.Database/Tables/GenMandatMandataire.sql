CREATE TABLE [GenMandatMandataire]
(
    [CleMandataire] INT IDENTITY NOT NULL,
    [CleMandat] INT NOT NULL,
    [ClePersonne] INT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_GenMandatMandataire] PRIMARY KEY ([CleMandataire]),
    CONSTRAINT [UK_GenMandatMandataire_CleMandat_ClePersonne_CleSociete_CleSecteur_CleService] UNIQUE ([CleMandat] , [ClePersonne] , [CleSociete] , [CleSecteur] , [CleService]),
    CONSTRAINT [FK_GenMandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [GenMandat] ([CleMandat]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenMandatMandataire_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]),
    CONSTRAINT [FK_GenMandatMandataire_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]),
    CONSTRAINT [FK_GenMandatMandataire_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSecteur] ([CleSecteur]),
    CONSTRAINT [FK_GenMandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenService] ([CleService]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Mandat parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleMandat'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Utilisateur mandataire.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'ClePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Société ayant accès au mandat, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Secteur ayant accès au mandat, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Service ayant accès au mandat, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = 'CleService'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, le mandat est suspendu.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'EstSuspendu'