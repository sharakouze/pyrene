CREATE TABLE [SA_TMPI].[Edi_DemCommemo] (
    [CleEdiCommemo]     INT             IDENTITY (1, 1) NOT NULL,
    [CleEdiDemande]     INT             NOT NULL,
    [CleEdiEchantillon] INT             NULL,
    [CleEdiParametre]   INT             NULL,
    [CleCommemo]        INT             NULL,
    [CleCommemo_Ref]    INT             NOT NULL,
    [ValCommemo_N]      DECIMAL (15, 5) NULL,
    [ValCommemo_A]      VARCHAR (255)   NULL,
    [CleValeur]         INT             NULL,
    [CleValeur_Ref]     INT             NULL,
    CONSTRAINT [PK_Edi_DemCommemo] PRIMARY KEY CLUSTERED ([CleEdiCommemo] ASC),
    CONSTRAINT [FK1_Edi_DemCommemo] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi_DemCommemo] FOREIGN KEY ([CleEdiEchantillon]) REFERENCES [SA_TMPI].[Edi_DemEchantillon] ([CleEdiEchantillon]),
    CONSTRAINT [FK3_Edi_DemCommemo] FOREIGN KEY ([CleEdiParametre]) REFERENCES [SA_TMPI].[Edi_DemParametre] ([CleEdiParametre]),
    CONSTRAINT [UN_Edi_DemCommemo] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [CleEdiEchantillon] ASC, [CleEdiParametre] ASC, [CleCommemo_Ref] ASC)
);

