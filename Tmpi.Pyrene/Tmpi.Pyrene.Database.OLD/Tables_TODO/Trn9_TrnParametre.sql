CREATE TABLE [SA_TMPI].[Trn9_TrnParametre] (
    [CleTournee]        INT             NOT NULL,
    [CleTache]          INT             NOT NULL,
    [CleTrnEchantillon] INT             NOT NULL,
    [CleTrnParametre]   INT             NOT NULL,
    [CleProduit]        SMALLINT        NOT NULL,
    [CleGroupeP]        SMALLINT        NOT NULL,
    [CleParametre]      INT             NOT NULL,
    [ValResultat_A]     VARCHAR (1000)  NULL,
    [OpeResultat]       NVARCHAR (50)   NULL,
    [ValResultat_N]     DECIMAL (18, 8) NULL,
    [ValResultat_D]     DATETIME        NULL,
    [ValResultat_L]     INT             NULL,
    CONSTRAINT [PK_Trn9_TrnParametre] PRIMARY KEY CLUSTERED ([CleTrnParametre] ASC),
    CONSTRAINT [FK1_Trn9_TrnParametre] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn9_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK2_Trn9_TrnParametre] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn9_TrnTache] ([CleTache]),
    CONSTRAINT [FK3_Trn9_TrnParametre] FOREIGN KEY ([CleTrnEchantillon]) REFERENCES [SA_TMPI].[Trn9_TrnEchantillon] ([CleTrnEchantillon])
);

