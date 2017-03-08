CREATE TABLE [SA_TMPI].[Gen_TrsPointIdent] (
    [ClePoint]    INT          NOT NULL,
    [CleTypIdent] SMALLINT     NOT NULL,
    [NumIdent]    VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_Gen_TrsPointIdent] PRIMARY KEY CLUSTERED ([ClePoint] ASC, [CleTypIdent] ASC),
    CONSTRAINT [FK1_Gen_TrsPointIdent] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint]),
    CONSTRAINT [UN_Gen_TrsPointIdent] UNIQUE NONCLUSTERED ([CleTypIdent] ASC, [NumIdent] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsPointIdent]
    ON [SA_TMPI].[Gen_TrsPointIdent]([NumIdent] ASC);

