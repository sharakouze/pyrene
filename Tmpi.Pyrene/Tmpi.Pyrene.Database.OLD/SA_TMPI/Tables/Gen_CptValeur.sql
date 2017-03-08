CREATE TABLE [SA_TMPI].[Gen_CptValeur] (
    [CleCompteur] SMALLINT NOT NULL,
    [CodPeriode]  INT      NOT NULL,
    [ValCompteur] INT      NOT NULL,
    CONSTRAINT [PK_Gen_CptValeur] PRIMARY KEY CLUSTERED ([CleCompteur] ASC, [CodPeriode] ASC),
    CONSTRAINT [FK1_Gen_CptValeur] FOREIGN KEY ([CleCompteur]) REFERENCES [SA_TMPI].[Gen_CptCompteur] ([CleCompteur])
);

