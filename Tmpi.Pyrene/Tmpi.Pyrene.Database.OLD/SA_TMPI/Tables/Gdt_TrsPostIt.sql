CREATE TABLE [SA_TMPI].[Gdt_TrsPostIt] (
    [ClePostIt]  INT NOT NULL,
    [CleTiers]   INT NOT NULL,
    [CleContact] INT NOT NULL,
    CONSTRAINT [PK_Gdt_TrsPostIt] PRIMARY KEY CLUSTERED ([CleContact] ASC, [ClePostIt] ASC, [CleTiers] ASC)
);

