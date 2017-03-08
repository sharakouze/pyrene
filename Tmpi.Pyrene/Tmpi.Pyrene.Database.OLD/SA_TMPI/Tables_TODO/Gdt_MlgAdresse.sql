CREATE TABLE [SA_TMPI].[Gdt_MlgAdresse] (
    [CleMailing] SMALLINT NOT NULL,
    [CleTiers]   INT      NOT NULL,
    [CleContact] INT      NOT NULL,
    CONSTRAINT [PK_Gdt_MlgAdresse] PRIMARY KEY CLUSTERED ([CleContact] ASC, [CleMailing] ASC, [CleTiers] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gdt_MlgAdresse]
    ON [SA_TMPI].[Gdt_MlgAdresse]([CleMailing] ASC);

