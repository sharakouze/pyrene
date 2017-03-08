CREATE TABLE [SA_TMPI].[Usys_LstValeur] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CleListe]    SMALLINT      NOT NULL,
    [CleValeur]   SMALLINT      NOT NULL,
    [CodValeur]   VARCHAR (50)  NULL,
    [LibValeur]   VARCHAR (100) NULL,
    [CleObjet]    INT           CONSTRAINT [DF_USys_LstValeur_CleObjet] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_USys_LstValeur] PRIMARY KEY CLUSTERED ([CleLogiciel] ASC, [CleListe] ASC, [CleObjet] ASC, [CleValeur] ASC),
    CONSTRAINT [UN_USys_LstValeur] UNIQUE NONCLUSTERED ([CleLogiciel] ASC, [CleListe] ASC, [CleObjet] ASC, [CodValeur] ASC)
);

