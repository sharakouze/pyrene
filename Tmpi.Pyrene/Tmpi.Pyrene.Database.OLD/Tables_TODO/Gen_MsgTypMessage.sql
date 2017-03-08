CREATE TABLE [SA_TMPI].[Gen_MsgTypMessage] (
    [CleTypMessage] SMALLINT       NOT NULL,
    [CodTypMessage] VARCHAR (50)   NOT NULL,
    [LibTypMessage] VARCHAR (100)  NOT NULL,
    [TxtTypMessage] VARCHAR (2000) NULL,
    [IndCopie]      BIT            CONSTRAINT [DF_Gen_MsgTypMessage_IndCopie] DEFAULT ((0)) NOT NULL,
    [IndAccuse]     BIT            CONSTRAINT [DF_Gen_MsgTypMessage_IndAccuse] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Gen_MsgTypMessage] PRIMARY KEY CLUSTERED ([CleTypMessage] ASC),
    CONSTRAINT [UN_Gen_MsgTypMessage] UNIQUE NONCLUSTERED ([CodTypMessage] ASC)
);

