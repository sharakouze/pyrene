CREATE TABLE [GenCompteurValeur] (
    [GenCompteurId] INT NOT NULL,
    [ValPeriode] INT NOT NULL,
    [ValCompteur] INT NOT NULL,
    CONSTRAINT [PK_GenCompteurValeur] PRIMARY KEY ([GenCompteurId], [ValPeriode]),
    CONSTRAINT [FK_GenCompteurValeur_GenCompteurId] FOREIGN KEY ([GenCompteurId]) REFERENCES [GenCompteur] ([Id]) ON DELETE CASCADE,
);

