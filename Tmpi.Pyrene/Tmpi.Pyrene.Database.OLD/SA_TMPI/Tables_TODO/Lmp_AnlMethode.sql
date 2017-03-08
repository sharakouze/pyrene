CREATE TABLE [SA_TMPI].[Lmp_AnlMethode] (
    [CleAnalyte] SMALLINT NOT NULL,
    [CleMethode] SMALLINT NOT NULL,
    CONSTRAINT [PK_Lmp_AnlMethode] PRIMARY KEY CLUSTERED ([CleAnalyte] ASC, [CleMethode] ASC),
    CONSTRAINT [FK1_Lmp_AnlMethode] FOREIGN KEY ([CleAnalyte]) REFERENCES [SA_TMPI].[Lmp_AnlAnalyte] ([CleAnalyte]),
    CONSTRAINT [FK2_Lmp_AnlMethode] FOREIGN KEY ([CleMethode]) REFERENCES [SA_TMPI].[Lmp_MetMethode] ([CleMethode])
);

