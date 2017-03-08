CREATE TABLE [SA_TMPI].[Lmp_ComValeur] (
    [CleCommemo]  SMALLINT      NOT NULL,
    [CleValeur_0] INT           NULL,
    [CodValeur]   VARCHAR (50)  NULL,
    [LibValeur]   VARCHAR (500) NULL,
    [CleValeur]   INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Lmp_ComValeur] PRIMARY KEY CLUSTERED ([CleValeur] ASC),
    CONSTRAINT [FK1_Lmp_ComValeur] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo])
);

