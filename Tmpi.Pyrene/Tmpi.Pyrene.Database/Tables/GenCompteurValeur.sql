CREATE TABLE [GenCompteurValeur] (
    [CleGenCompteur] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_GenCompteurValeur] PRIMARY KEY ([CleGenCompteur], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_CleGenCompteur] FOREIGN KEY ([CleGenCompteur]) REFERENCES [GenCompteur] ([Id]) ON DELETE CASCADE,
);

