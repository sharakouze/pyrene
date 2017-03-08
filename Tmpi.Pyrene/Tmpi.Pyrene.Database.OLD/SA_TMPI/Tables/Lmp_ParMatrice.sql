CREATE TABLE [SA_TMPI].[Lmp_ParMatrice] (
    [CleMatrice]   SMALLINT NOT NULL,
    [CleParametre] INT      NOT NULL,
    CONSTRAINT [PK_Lmp_ParMatrice] PRIMARY KEY CLUSTERED ([CleParametre] ASC, [CleMatrice] ASC),
    CONSTRAINT [FK1_Lmp_ParMatrice] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

