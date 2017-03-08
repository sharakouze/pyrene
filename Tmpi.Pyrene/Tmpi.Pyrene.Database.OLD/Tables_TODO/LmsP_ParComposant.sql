CREATE TABLE [SA_TMPI].[LmsP_ParComposant] (
    [CleParametre] INT NOT NULL,
    [CleComposant] INT NOT NULL,
    CONSTRAINT [PK_LmsP_ParComposant] PRIMARY KEY CLUSTERED ([CleParametre] ASC, [CleComposant] ASC),
    CONSTRAINT [FK1_LmsP_ParParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK2_LmsP_ParParametre] FOREIGN KEY ([CleComposant]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

