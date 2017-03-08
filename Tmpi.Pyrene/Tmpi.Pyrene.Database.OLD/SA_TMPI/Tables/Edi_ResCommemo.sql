CREATE TABLE [SA_TMPI].[Edi_ResCommemo] (
    [CleDosCommemo]     INT           NOT NULL,
    [CleDossier]        INT           NOT NULL,
    [CleDosPrelevement] INT           NULL,
    [CleDosEchantillon] INT           NULL,
    [CleDosParametre]   INT           NULL,
    [CleCommemo]        INT           NOT NULL,
    [CleCommemo_Ref]    INT           NULL,
    [ValCommemo_A]      VARCHAR (255) NULL,
    [ValCommemo_D]      SMALLDATETIME NULL,
    [CleValeur]         INT           NULL,
    [CleValeur_Ref]     INT           NULL,
    CONSTRAINT [PK_Edi_ResCommemo] PRIMARY KEY CLUSTERED ([CleDosCommemo] ASC),
    CONSTRAINT [UN_Edi_ResCommemo] UNIQUE NONCLUSTERED ([CleDossier] ASC, [CleDosPrelevement] ASC, [CleDosEchantillon] ASC, [CleDosParametre] ASC, [CleCommemo] ASC)
);

