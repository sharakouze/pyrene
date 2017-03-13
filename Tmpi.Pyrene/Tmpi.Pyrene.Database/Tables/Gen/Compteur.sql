CREATE TABLE [Gen].[Compteur]
(
	[Id] INT NOT NULL IDENTITY,
	[CodObjet] VARCHAR(100) NOT NULL,
	[LibObjet] VARCHAR(200) NOT NULL,
	[TxtObjet] VARCHAR(2000) NULL,
	[EstActif] BIT NOT NULL,
	[DatCreation] DATETIME NOT NULL,
	[DatModif] DATETIME NOT NULL,
	[CodExterne] VARCHAR(100) NULL,
	[TypPeriodicite] INT NOT NULL,
	[TypCompteur] INT NOT NULL,
	[ServiceId] INT NULL,
	[ValFormatNumero] VARCHAR(100) NOT NULL,
	CONSTRAINT [PK_Compteur] PRIMARY KEY ([Id]),
	CONSTRAINT [UK_Compteur_CodObjet] UNIQUE ([CodObjet]),
	CONSTRAINT [UK_Compteur_TypCompteur_ServiceId] UNIQUE ([TypCompteur], [ServiceId]),
	CONSTRAINT [FK_Compteur_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [Gen].[Service] ([Id]),
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Périodicité.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Compteur',
    @level2type = N'COLUMN',
    @level2name = N'TypPeriodicite'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Type de compteur.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Compteur',
    @level2type = N'COLUMN',
    @level2name = N'TypCompteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Format du modèle de numérotation.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Compteur',
    @level2type = N'COLUMN',
    @level2name = N'ValFormatNumero'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service ayant accès au compteur, ou null pour tous les services.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Compteur',
    @level2type = N'COLUMN',
    @level2name = 'ServiceId'