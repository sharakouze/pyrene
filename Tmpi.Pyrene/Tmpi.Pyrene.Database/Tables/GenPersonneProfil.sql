﻿CREATE TABLE [GenPersonneProfil]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenPersonne] INT NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_GenPersonneProfil_CodObjet_CleGenPersonne] UNIQUE ([CodObjet], [CleGenPersonne]), 
    CONSTRAINT [UK_GenPersonneProfil_CleGenPersonne_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([CleGenPersonne], [CleGenSociete], [CleGenSecteur], [CleGenService]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = N'CleGenPersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id de la société à laquelle a accès le profil, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du secteur auquel a accès le profil, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du service auquel a accès le profil, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneProfil',
    @level2type = N'COLUMN',
    @level2name = N'CleGenService'