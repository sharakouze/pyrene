CREATE TABLE [GenCompteur] (
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypPeriodicite] INT NOT NULL,
    [TypCompteur] INT NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
	[ValFormatNumero] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_GenCompteur] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenCompteur_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [UK_GenCompteur_TypCompteur_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([TypCompteur], [CleGenSociete], [CleGenSecteur], [CleGenService]),
    CONSTRAINT [FK_GenCompteur_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenCompteur_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenCompteur_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);


GO

CREATE INDEX [IX_GenCompteur_LibObjet] ON [GenCompteur] ([LibObjet]);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Périodicité.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'TypPeriodicite'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Type de compteur.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'TypCompteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Format du modèle de numérotation.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'ValFormatNumero'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id de la société ayant accès au compteur, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du secteur ayant accès au compteur, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du service ayant accès au compteur, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = N'CleGenService'