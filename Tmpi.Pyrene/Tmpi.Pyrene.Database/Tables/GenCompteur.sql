CREATE TABLE [GenCompteur] (
    [CleCompteur] INT NOT NULL IDENTITY,
    [CodCompteur] VARCHAR(100) NOT NULL,
    [LibCompteur] VARCHAR(200) NOT NULL,
    [TxtCompteur] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypPeriodicite] INT NOT NULL,
    [TypCompteur] INT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
	[ValFormatNumero] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_GenCompteur] PRIMARY KEY ([CleCompteur]),
    CONSTRAINT [UK_GenCompteur_CodCompteur] UNIQUE ([CodCompteur]),
    CONSTRAINT [UK_GenCompteur_TypCompteur_CleSociete_CleSecteur_CleService] UNIQUE ([TypCompteur], [CleSociete], [CleSecteur], [CleService]),
    CONSTRAINT [FK_GenCompteur_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]),
    CONSTRAINT [FK_GenCompteur_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSecteur] ([CleSecteur]),
    CONSTRAINT [FK_GenCompteur_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenService] ([CleService]),
);

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
    @value = N'Société ayant accès au compteur, ou null pour toutes les sociétés.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = 'CleSociete'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Secteur ayant accès au compteur, ou null pour tous les secteurs.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = 'CleSecteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Service ayant accès au compteur, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = 'CleService'