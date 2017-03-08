CREATE TABLE [SA_TMPI].[Lsn_MLsnAcces] (
    [CleMLiaison] SMALLINT NOT NULL,
    [ClePerso]    SMALLINT NOT NULL,
    CONSTRAINT [PK_Lsn_MLsnAcces] PRIMARY KEY CLUSTERED ([CleMLiaison] ASC, [ClePerso] ASC),
    CONSTRAINT [FK1_Lsn_MLsnAcces] FOREIGN KEY ([CleMLiaison]) REFERENCES [SA_TMPI].[Lsn_MLsnMLiaison] ([CleMLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_MLsnAcces]
    ON [SA_TMPI].[Lsn_MLsnAcces]([CleMLiaison] ASC);

