CREATE TABLE [SA_TMPI].[Lms_DemCommemo] (
    [CleDemCommemo]     INT             IDENTITY (1, 1) NOT NULL,
    [CleDemande]        INT             NOT NULL,
    [CleDemEchantillon] INT             NULL,
    [CleDemParametre]   INT             NULL,
    [CleCommemo]        SMALLINT        NOT NULL,
    [ValCommemo_N]      DECIMAL (15, 5) NULL,
    [ValCommemo_A]      VARCHAR (255)   NULL,
    [ValCommemo_L]      INT             NULL,
    CONSTRAINT [PK_Lms_DemCommemo] PRIMARY KEY CLUSTERED ([CleDemCommemo] ASC),
    CONSTRAINT [FK1_Lms_DemCommemo] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Lms_DemDemande] ([CleDemande]),
    CONSTRAINT [FK2_Lms_DemCommemo] FOREIGN KEY ([CleDemEchantillon]) REFERENCES [SA_TMPI].[Lms_DemEchantillon] ([CleDemEchantillon]),
    CONSTRAINT [FK3_Lms_DemCommemo] FOREIGN KEY ([CleDemParametre]) REFERENCES [SA_TMPI].[Lms_DemParametre] ([CleDemParametre]),
    CONSTRAINT [FK4_Lms_DemCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo]),
    CONSTRAINT [FK5_Lms_DemCommemo] FOREIGN KEY ([ValCommemo_L]) REFERENCES [SA_TMPI].[Lmp_ComValeur] ([CleValeur]),
    CONSTRAINT [UN_Lms_DemCommemo] UNIQUE NONCLUSTERED ([CleDemande] ASC, [CleDemEchantillon] ASC, [CleDemParametre] ASC, [CleCommemo] ASC)
);

