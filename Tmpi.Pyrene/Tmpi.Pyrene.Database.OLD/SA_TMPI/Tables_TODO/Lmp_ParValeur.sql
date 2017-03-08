CREATE TABLE [SA_TMPI].[Lmp_ParValeur] (
    [CleParametre] INT      NOT NULL,
    [CleValeur]    SMALLINT NOT NULL,
    CONSTRAINT [PK_Lmp_ParValeur] PRIMARY KEY CLUSTERED ([CleParametre] ASC, [CleValeur] ASC),
    CONSTRAINT [FK_Lmp_ParValeur_CleValeur] FOREIGN KEY ([CleValeur]) REFERENCES [SA_TMPI].[Lmp_Par_Valeur] ([CleValeur]),
    CONSTRAINT [FK1_Lmp_ParValeur] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

