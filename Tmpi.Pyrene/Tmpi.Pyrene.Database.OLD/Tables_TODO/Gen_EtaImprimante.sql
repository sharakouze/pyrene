CREATE TABLE [SA_TMPI].[Gen_EtaImprimante] (
    [CleEtat]       SMALLINT NOT NULL,
    [ClePersonne]   SMALLINT NOT NULL,
    [CleImprimante] SMALLINT NOT NULL,
    CONSTRAINT [PK_Gen_EtaImprimante] PRIMARY KEY CLUSTERED ([CleEtat] ASC, [ClePersonne] ASC),
    CONSTRAINT [FK_Gen_EtaImprimante_CleImprimante] FOREIGN KEY ([CleImprimante]) REFERENCES [SA_TMPI].[Gen_DivImprimante] ([CleImprimante]),
    CONSTRAINT [FK_Gen_EtaImprimante_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

