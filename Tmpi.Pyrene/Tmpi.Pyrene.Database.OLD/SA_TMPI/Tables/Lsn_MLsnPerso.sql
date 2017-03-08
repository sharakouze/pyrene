CREATE TABLE [SA_TMPI].[Lsn_MLsnPerso] (
    [CleMLiaison] SMALLINT     NOT NULL,
    [ClePerso]    SMALLINT     NOT NULL,
    [CodParam]    VARCHAR (50) NOT NULL,
    [ValParam]    VARCHAR (50) NULL,
    CONSTRAINT [PK_Lsn_MLsnPerso] PRIMARY KEY CLUSTERED ([CleMLiaison] ASC, [ClePerso] ASC, [CodParam] ASC),
    CONSTRAINT [FK1_Lsn_MLsnPerso] FOREIGN KEY ([CleMLiaison]) REFERENCES [SA_TMPI].[Lsn_MLsnMLiaison] ([CleMLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_MLsnPerso]
    ON [SA_TMPI].[Lsn_MLsnPerso]([CleMLiaison] ASC);

