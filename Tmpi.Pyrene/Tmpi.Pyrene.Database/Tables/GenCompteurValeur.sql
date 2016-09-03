CREATE TABLE [GenCompteurValeur] (
    [CleGenCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [UK_GenCompteurValeur] UNIQUE ([CleGenCompteur], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_CleGenCompteur] FOREIGN KEY ([CleGenCompteur]) REFERENCES [GenCompteur] ([Id]) ON DELETE CASCADE,
);

