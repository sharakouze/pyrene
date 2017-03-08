CREATE TABLE [SA_TMPI].[Aup_AutParametre] (
    [CleAutomate]    SMALLINT NOT NULL,
    [CleAutAnalyse]  SMALLINT NOT NULL,
    [CleParametre]   INT      NOT NULL,
    [TypRemplissage] TINYINT  CONSTRAINT [DF_Aup_AutParametre_TypRemplissage] DEFAULT ((0)) NOT NULL,
    [VolAPrelever]   SMALLINT NULL,
    CONSTRAINT [PK_Aup_AutParametre] PRIMARY KEY CLUSTERED ([CleAutAnalyse] ASC, [CleParametre] ASC),
    CONSTRAINT [FK1_AutP_AutParametre] FOREIGN KEY ([CleAutomate]) REFERENCES [SA_TMPI].[Aup_AutAutomate] ([CleAutomate]),
    CONSTRAINT [FK2_AutP_AutParametre] FOREIGN KEY ([CleAutAnalyse]) REFERENCES [SA_TMPI].[Aup_AutAnalyse] ([CleAutAnalyse])
);

