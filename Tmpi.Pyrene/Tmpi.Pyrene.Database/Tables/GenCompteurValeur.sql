CREATE TABLE [GenCompteurValeur] (
    [Id] INT NOT NULL IDENTITY,
    [CleGenCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_GenCompteurValeur] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenCompteurValeur] UNIQUE ([CleGenCompteur], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_CleGenCompteur] FOREIGN KEY ([CleGenCompteur]) REFERENCES [GenCompteur] ([Id]) ON DELETE CASCADE,
);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du compteur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenCompteurValeur',
    @level2type = N'COLUMN',
    @level2name = N'CleGenCompteur'
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
