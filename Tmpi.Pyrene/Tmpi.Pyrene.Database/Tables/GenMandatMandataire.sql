CREATE TABLE [GenMandatMandataire]
(
    [Id] INT IDENTITY NOT NULL,
    [CleGenMandat] INT NOT NULL,
    [CleGenPersonne] INT NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_GenMandatMandataire] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenMandatMandataire_CleGenMandat_CleGenPersonne_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([CleGenMandat] , [CleGenPersonne] , [CleGenSociete] , [CleGenSecteur] , [CleGenService]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenMandat] FOREIGN KEY ([CleGenMandat]) REFERENCES [GenMandat] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenMandatMandataire_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du mandat parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'CleGenMandat'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id de l''utilisateur mandataire.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'CleGenPersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id de la société ayant accès au mandat, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du secteur ayant accès au mandat, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du service ayant accès au mandat, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'CleGenService'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, le mandat est suspendu.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenMandatMandataire',
    @level2type = N'COLUMN',
    @level2name = N'EstSuspendu'