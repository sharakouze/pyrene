CREATE TABLE [GEN].[CompteurValeur] (
    [CleCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_CompteurValeur] PRIMARY KEY ([CleCompteur], [ValPeriode]),
    CONSTRAINT [FK_CompteurValeur_CleCompteur] FOREIGN KEY ([CleCompteur]) REFERENCES [GEN].[Compteur] ([CleCompteur]) ON DELETE CASCADE
);

