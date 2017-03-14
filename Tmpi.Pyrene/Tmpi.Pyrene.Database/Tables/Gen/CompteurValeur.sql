CREATE TABLE [Gen].[CompteurValeur] (
    [Id] INT NOT NULL IDENTITY,
    [CompteurId] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
	[DatCreation] DATETIME NOT NULL,
	[DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_CompteurValeur] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_CompteurValeur_CompteurId_ValPeriode] UNIQUE ([CompteurId], [ValPeriode]),
    CONSTRAINT [FK_CompteurValeur_CompteurId] FOREIGN KEY ([CompteurId]) REFERENCES [Gen].[Compteur] ([Id]) ON DELETE CASCADE,
);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du compteur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'CompteurValeur',
    @level2type = N'COLUMN',
    @level2name = 'CompteurId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Valeur de la période.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'CompteurValeur',
    @level2type = N'COLUMN',
    @level2name = N'ValPeriode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Valeur du compteur.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'CompteurValeur',
    @level2type = N'COLUMN',
    @level2name = N'ValCompteur'
