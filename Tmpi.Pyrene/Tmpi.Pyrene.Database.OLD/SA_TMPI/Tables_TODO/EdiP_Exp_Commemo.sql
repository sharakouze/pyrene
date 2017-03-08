CREATE TABLE [SA_TMPI].[EdiP_Exp_Commemo] (
    [CleExport]  SMALLINT NOT NULL,
    [CleCommemo] INT      NOT NULL,
    CONSTRAINT [PK_EdiP_Exp_Commemo] PRIMARY KEY CLUSTERED ([CleExport] ASC, [CleCommemo] ASC),
    CONSTRAINT [FK1_EdiP_Exp_Commemo] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport])
);

