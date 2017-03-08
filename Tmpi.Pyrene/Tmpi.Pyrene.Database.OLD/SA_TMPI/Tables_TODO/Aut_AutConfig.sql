CREATE TABLE [SA_TMPI].[Aut_AutConfig] (
    [CleAutomate]  INT           NOT NULL,
    [CleAutConfig] SMALLINT      NOT NULL,
    [ValPropriete] VARCHAR (255) NULL,
    CONSTRAINT [UN1_Aut_AutConfig] UNIQUE NONCLUSTERED ([CleAutConfig] ASC, [CleAutomate] ASC)
);

