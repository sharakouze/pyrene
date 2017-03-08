CREATE TABLE [SA_TMPI].[Lmp_FeuCommemo] (
    [CleMFeuille] SMALLINT NULL,
    [CleCommemo]  SMALLINT NULL,
    CONSTRAINT [FK1_Lmp_FeuCommemo] FOREIGN KEY ([CleMFeuille]) REFERENCES [SA_TMPI].[Lmp_FeuMFeuille] ([CleMFeuille]),
    CONSTRAINT [FK2_Lmp_FeuCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo])
);

