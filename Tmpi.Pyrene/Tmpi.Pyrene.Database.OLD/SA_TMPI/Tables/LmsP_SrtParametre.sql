CREATE TABLE [SA_TMPI].[LmsP_SrtParametre] (
    [CleEtat]      SMALLINT     NOT NULL,
    [CleParametre] INT          NOT NULL,
    [CodAlias]     VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_LmsP_SrtParametre] PRIMARY KEY CLUSTERED ([CleEtat] ASC, [CleParametre] ASC),
    CONSTRAINT [FK1_LmsP_SrtParametre] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat]),
    CONSTRAINT [FK2_LmsP_SrtParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);


GO
CREATE NONCLUSTERED INDEX [ID1_LmsP_SrtParametre]
    ON [SA_TMPI].[LmsP_SrtParametre]([CleEtat] ASC);

