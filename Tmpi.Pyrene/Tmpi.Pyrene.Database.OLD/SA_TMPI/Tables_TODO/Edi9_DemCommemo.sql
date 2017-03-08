CREATE TABLE [SA_TMPI].[Edi9_DemCommemo] (
    [CleEdiCommemo]     INT             NOT NULL,
    [CleEdiDemande]     INT             NOT NULL,
    [CleEdiEchantillon] INT             NULL,
    [CleEdiParametre]   INT             NULL,
    [CleCommemo]        INT             NULL,
    [CleCommemo_Ref]    INT             NOT NULL,
    [ValCommemo_N]      DECIMAL (15, 5) NULL,
    [ValCommemo_A]      VARCHAR (255)   NULL,
    [CleValeur]         INT             NULL,
    [CleValeur_Ref]     INT             NULL,
    CONSTRAINT [PK_Edi9_DemCommemo] PRIMARY KEY CLUSTERED ([CleEdiCommemo] ASC),
    CONSTRAINT [FK1_Edi9_DemCommemo] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi9_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi9_DemCommemo] FOREIGN KEY ([CleEdiEchantillon]) REFERENCES [SA_TMPI].[Edi9_DemEchantillon] ([CleEdiEchantillon]),
    CONSTRAINT [FK3_Edi9_DemCommemo] FOREIGN KEY ([CleEdiParametre]) REFERENCES [SA_TMPI].[Edi9_DemParametre] ([CleEdiParametre]),
    CONSTRAINT [UN_Edi9_DemCommemo] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [CleEdiEchantillon] ASC, [CleEdiParametre] ASC, [CleCommemo_Ref] ASC)
);

