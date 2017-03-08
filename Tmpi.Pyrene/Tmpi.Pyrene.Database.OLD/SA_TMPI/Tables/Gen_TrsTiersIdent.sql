CREATE TABLE [SA_TMPI].[Gen_TrsTiersIdent] (
    [CleTiers]    INT          NOT NULL,
    [CleTypIdent] SMALLINT     NOT NULL,
    [NumIdent]    VARCHAR (25) NULL,
    CONSTRAINT [PK_Gen_TrsTiersIdent] PRIMARY KEY CLUSTERED ([CleTiers] ASC, [CleTypIdent] ASC),
    CONSTRAINT [FK1_Gen_TrsTiersIdent] FOREIGN KEY ([CleTiers]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK2_Gen_TrsTiersIdent] FOREIGN KEY ([CleTypIdent]) REFERENCES [SA_TMPI].[Gen_TrsTypIdent] ([CleTypIdent])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsTiersIdent]
    ON [SA_TMPI].[Gen_TrsTiersIdent]([NumIdent] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Gen_TrsTiersIdent]
    ON [SA_TMPI].[Gen_TrsTiersIdent]([CleTypIdent] ASC);

