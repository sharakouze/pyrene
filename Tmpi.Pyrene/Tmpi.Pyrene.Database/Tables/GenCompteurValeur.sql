CREATE TABLE [GenCompteurValeur] (
    [CleValeur] INT NOT NULL IDENTITY,
    [CleCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_GenCompteurValeur] PRIMARY KEY ([CleValeur]),
    CONSTRAINT [UK_GenCompteurValeur_CleCompteur_ValPeriode] UNIQUE ([CleCompteur], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_CleCompteur] FOREIGN KEY ([CleCompteur]) REFERENCES [GenCompteur] ([CleCompteur]) ON DELETE CASCADE,
);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du compteur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteurValeur',
    @level2type = N'COLUMN',
    @level2name = 'CleCompteur'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Valeur de la période.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteurValeur',
    @level2type = N'COLUMN',
    @level2name = N'ValPeriode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Valeur du compteur.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteurValeur',
    @level2type = N'COLUMN',
    @level2name = N'ValCompteur'
