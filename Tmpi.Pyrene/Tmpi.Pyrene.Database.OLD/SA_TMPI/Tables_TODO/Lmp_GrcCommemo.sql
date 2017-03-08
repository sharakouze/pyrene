CREATE TABLE [SA_TMPI].[Lmp_GrcCommemo] (
    [CleGroupeC]    SMALLINT NOT NULL,
    [CleGrcCommemo] SMALLINT IDENTITY (1, 1) NOT NULL,
    [CleCommemo]    SMALLINT NOT NULL,
    [NumOrdre]      SMALLINT CONSTRAINT [DF_Lmp_GrcCommemo_NumOrdre] DEFAULT ((999)) NOT NULL,
    CONSTRAINT [PK_Lmp_GrcCommemo] PRIMARY KEY CLUSTERED ([CleGrcCommemo] ASC),
    CONSTRAINT [FK1_Lmp_GrcCommemo] FOREIGN KEY ([CleGroupeC]) REFERENCES [SA_TMPI].[Lmp_GrcGroupeC] ([CleGroupeC]),
    CONSTRAINT [FK3_Lmp_GrcCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo]),
    CONSTRAINT [UN_Lmp_GrcCommemo] UNIQUE NONCLUSTERED ([CleGroupeC] ASC, [CleCommemo] ASC)
);

