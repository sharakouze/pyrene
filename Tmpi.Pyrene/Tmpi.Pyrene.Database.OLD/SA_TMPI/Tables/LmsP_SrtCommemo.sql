CREATE TABLE [SA_TMPI].[LmsP_SrtCommemo] (
    [CleEtat]    SMALLINT     NOT NULL,
    [CleCommemo] SMALLINT     NOT NULL,
    [CodAlias]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_LmsP_SrtCommemo] PRIMARY KEY CLUSTERED ([CleEtat] ASC, [CleCommemo] ASC),
    CONSTRAINT [FK1_LmsP_SrtCommemo] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat]),
    CONSTRAINT [FK2_LmsP_SrtCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo])
);


GO
CREATE NONCLUSTERED INDEX [ID1_LmsP_SrtCommemo]
    ON [SA_TMPI].[LmsP_SrtCommemo]([CleEtat] ASC);

