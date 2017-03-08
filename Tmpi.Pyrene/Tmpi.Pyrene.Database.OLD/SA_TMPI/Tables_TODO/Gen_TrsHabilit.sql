CREATE TABLE [SA_TMPI].[Gen_TrsHabilit] (
    [CleHabilit] SMALLINT NOT NULL,
    [CleTiers]   INT      NOT NULL,
    CONSTRAINT [PK_Gen_TrsHabilit] PRIMARY KEY CLUSTERED ([CleHabilit] ASC, [CleTiers] ASC),
    CONSTRAINT [FK1_Gen_TrsHabilit] FOREIGN KEY ([CleHabilit]) REFERENCES [SA_TMPI].[Gen_Trs_Habilit] ([CleHabilit]),
    CONSTRAINT [FK2_Gen_TrsHabilit] FOREIGN KEY ([CleTiers]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers])
);

