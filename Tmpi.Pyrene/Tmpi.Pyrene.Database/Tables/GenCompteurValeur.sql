CREATE TABLE [GenCompteurValeur] (
    [CleCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_GenCompteurValeur] PRIMARY KEY ([CleCompteur], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_CleCompteur] FOREIGN KEY ([CleCompteur]) REFERENCES [GenCompteur] ([CleCompteur]) ON DELETE CASCADE,
);

