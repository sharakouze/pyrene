CREATE TABLE [SA_TMPI].[Trp_MtrPoint] (
    [CleMTournee] INT      NOT NULL,
    [ClePoint]    INT      NOT NULL,
    [NumOrdre]    SMALLINT CONSTRAINT [DF_Trp_MtrPoint_NumOrdre] DEFAULT ((0)) NOT NULL,
    [HeuPrevue]   SMALLINT NULL,
    CONSTRAINT [PK_Trn_MtrPoint] PRIMARY KEY CLUSTERED ([CleMTournee] ASC, [ClePoint] ASC)
);

