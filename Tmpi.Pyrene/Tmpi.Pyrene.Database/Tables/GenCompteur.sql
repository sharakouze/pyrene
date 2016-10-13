CREATE TABLE [GenCompteur] (
    [CleCompteur] INT NOT NULL IDENTITY,
    [CodCompteur] VARCHAR(100) NOT NULL,
    [LibCompteur] VARCHAR(200) NOT NULL,
    [TxtCompteur] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypPeriodicite] INT NOT NULL,
    [TypCompteur] INT NOT NULL,
    [CleService] INT NULL,
	[ValFormatNumero] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_GenCompteur] PRIMARY KEY ([CleCompteur]),
    CONSTRAINT [UK_GenCompteur_CodCompteur] UNIQUE ([CodCompteur]),
    CONSTRAINT [UK_GenCompteur_TypCompteur_CleService] UNIQUE ([TypCompteur], [CleService]),
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
    @value = N'Clé du service ayant accès au compteur, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteur',
    @level2type = N'COLUMN',
    @level2name = 'CleService'