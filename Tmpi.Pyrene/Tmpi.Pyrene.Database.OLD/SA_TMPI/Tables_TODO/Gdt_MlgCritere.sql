CREATE TABLE [SA_TMPI].[Gdt_MlgCritere] (
    [CleMailing] SMALLINT NOT NULL,
    [CleCritere] SMALLINT NOT NULL,
    CONSTRAINT [PK_Gdt_MlgCritere] PRIMARY KEY CLUSTERED ([CleCritere] ASC, [CleMailing] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gdt_MlgCritere]
    ON [SA_TMPI].[Gdt_MlgCritere]([CleMailing] ASC);

