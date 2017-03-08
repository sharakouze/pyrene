CREATE TABLE [SA_TMPI].[Trn9_TrnCommemo] (
    [CleTournee]        INT             NOT NULL,
    [CleTache]          INT             NOT NULL,
    [CleTrnEchantillon] INT             NOT NULL,
    [CleTrnCommemo]     INT             NOT NULL,
    [TypCommemo]        TINYINT         NOT NULL,
    [CleCommemo]        SMALLINT        NOT NULL,
    [ValResultat_A]     VARCHAR (1000)  NULL,
    [OpeResultat]       VARCHAR (2)     NULL,
    [ValResultat_N]     DECIMAL (21, 8) NULL,
    [ValResultat_D]     SMALLDATETIME   NULL,
    [ValResultat_L]     SMALLINT        NULL,
    CONSTRAINT [PK_Trn_Commemo] PRIMARY KEY CLUSTERED ([CleTrnCommemo] ASC),
    CONSTRAINT [FK1_Trn9_TrnCommemo] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn9_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK2_Trn9_TrnCommemo] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn9_TrnTache] ([CleTache]),
    CONSTRAINT [FK3_Trn9_TrnCommemo] FOREIGN KEY ([CleTrnEchantillon]) REFERENCES [SA_TMPI].[Trn9_TrnEchantillon] ([CleTrnEchantillon])
);

