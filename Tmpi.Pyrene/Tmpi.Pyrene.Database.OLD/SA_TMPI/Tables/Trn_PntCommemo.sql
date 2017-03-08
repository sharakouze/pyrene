CREATE TABLE [SA_TMPI].[Trn_PntCommemo] (
    [ClePoint]     INT           NOT NULL,
    [CleCommemo]   SMALLINT      NOT NULL,
    [ValResultat]  VARCHAR (100) NULL,
    [ValResultatN] VARCHAR (100) NULL,
    [ValResultatD] VARCHAR (100) NULL,
    [ValResultatL] VARCHAR (100) NULL,
    [OpeResultat]  VARCHAR (2)   NULL,
    CONSTRAINT [PK_Trn_PntCommemo] PRIMARY KEY CLUSTERED ([CleCommemo] ASC, [ClePoint] ASC),
    CONSTRAINT [FK1_Trn_PntCommemo] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntCommemo]
    ON [SA_TMPI].[Trn_PntCommemo]([ClePoint] ASC);

