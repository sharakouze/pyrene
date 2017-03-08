CREATE TABLE [SA_TMPI].[Lmp_FeuParametre] (
    [CleMFeuille]  SMALLINT NOT NULL,
    [CleParametre] INT      NOT NULL,
    CONSTRAINT [PK_Lmp_FeuParametre] PRIMARY KEY CLUSTERED ([CleMFeuille] ASC, [CleParametre] ASC),
    CONSTRAINT [FK1_Lmp_FeuParametre] FOREIGN KEY ([CleMFeuille]) REFERENCES [SA_TMPI].[Lmp_FeuMFeuille] ([CleMFeuille]),
    CONSTRAINT [FK2_Lmp_FeuParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

