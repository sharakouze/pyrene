CREATE TABLE [SA_TMPI].[Sto_EfaImputation] (
    [CleFacture]    INT             NOT NULL,
    [TauTVA]        DECIMAL (5, 2)  NOT NULL,
    [CleImputation] SMALLINT        NULL,
    [MntHT]         DECIMAL (15, 2) NOT NULL,
    [MntTVA]        DECIMAL (15, 2) NOT NULL
);

