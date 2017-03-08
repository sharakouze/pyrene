CREATE TABLE [SA_TMPI].[Gen_MsgHisto] (
    [CleMessage]    INT            NOT NULL,
    [TypMedia]      TINYINT        NOT NULL,
    [CleTypMessage] SMALLINT       NOT NULL,
    [NomTiers]      VARCHAR (100)  NOT NULL,
    [NomContact]    VARCHAR (100)  NULL,
    [AdrMail]       VARCHAR (1000) NULL,
    [IndAccuse]     BIT            NOT NULL,
    [DatDepot]      SMALLDATETIME  NULL,
    [CleDeposant]   SMALLINT       NULL,
    [DatPrevue]     SMALLDATETIME  NULL,
    [DatEnvoi]      SMALLDATETIME  NULL,
    [CleExpediteur] SMALLINT       NULL,
    [LibMessage]    VARCHAR (100)  NULL,
    [TxtMessage]    VARCHAR (8000) NULL,
    CONSTRAINT [PK_Gen_MsgHisto] PRIMARY KEY CLUSTERED ([CleMessage] ASC),
    CONSTRAINT [FK1_Gen_MsgHisto] FOREIGN KEY ([CleTypMessage]) REFERENCES [SA_TMPI].[Gen_MsgTypMessage] ([CleTypMessage])
);

