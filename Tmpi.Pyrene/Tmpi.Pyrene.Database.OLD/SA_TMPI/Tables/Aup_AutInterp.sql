CREATE TABLE [SA_TMPI].[Aup_AutInterp] (
    [CleAutomate]    INT          NOT NULL,
    [CleAutInterp]   INT          IDENTITY (1, 1) NOT NULL,
    [CodInterp]      VARCHAR (50) NOT NULL,
    [CleInterp_LIMS] INT          NOT NULL,
    CONSTRAINT [PK_Aup_AutInterp] PRIMARY KEY CLUSTERED ([CleAutInterp] ASC),
    CONSTRAINT [UN_Aup_AutInterp] UNIQUE NONCLUSTERED ([CleAutomate] ASC, [CodInterp] ASC)
);

