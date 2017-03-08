CREATE TABLE [SA_TMPI].[Gen_TrsTiersType] (
    [CleTiers]    INT      NOT NULL,
    [CleTypTiers] SMALLINT NOT NULL,
    CONSTRAINT [PK_Gen_TrsTiersType] PRIMARY KEY CLUSTERED ([CleTiers] ASC, [CleTypTiers] ASC),
    CONSTRAINT [FK1_Gen_TrsTiersType] FOREIGN KEY ([CleTiers]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK2_Gen_TrsTiersType] FOREIGN KEY ([CleTypTiers]) REFERENCES [SA_TMPI].[Gen_TrsTypTiers] ([CleTypTiers])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsTiersIdent]
    ON [SA_TMPI].[Gen_TrsTiersType]([CleTypTiers] ASC);

