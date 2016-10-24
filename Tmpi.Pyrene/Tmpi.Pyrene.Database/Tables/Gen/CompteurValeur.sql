CREATE TABLE [Gen].[CompteurValeur] (
    [CleValeur] INT NOT NULL IDENTITY,
    [CleCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_CompteurValeur] PRIMARY KEY ([CleValeur]),
    CONSTRAINT [UK_CompteurValeur_CleCompteur_ValPeriode] UNIQUE ([CleCompteur], [ValPeriode]),
    CONSTRAINT [FK_CompteurValeur_CleCompteur] FOREIGN KEY ([CleCompteur]) REFERENCES [Gen].[Compteur] ([CleCompteur]) ON DELETE CASCADE,
);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du compteur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'CompteurValeur',
    @level2type = N'COLUMN',
    @level2name = 'CleCompteur'
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
