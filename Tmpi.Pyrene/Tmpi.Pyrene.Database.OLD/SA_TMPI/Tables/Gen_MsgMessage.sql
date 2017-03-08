CREATE TABLE [SA_TMPI].[Gen_MsgMessage] (
    [CleMessage]    INT            IDENTITY (1, 1) NOT NULL,
    [TypMedia]      TINYINT        NOT NULL,
    [CleTypMessage] SMALLINT       NOT NULL,
    [NomTiers]      VARCHAR (100)  NOT NULL,
    [NomContact]    VARCHAR (100)  NULL,
    [AdrMail]       VARCHAR (1000) NULL,
    [IndAccuse]     BIT            CONSTRAINT [DF_Gen_MsgMessage_IndAccuse] DEFAULT ((0)) NOT NULL,
    [IndCopie]      BIT            CONSTRAINT [DF_Gen_MsgMessage_IndCopie] DEFAULT ((0)) NOT NULL,
    [DatDepot]      SMALLDATETIME  NULL,
    [CleDeposant]   SMALLINT       NULL,
    [DatPrevue]     SMALLDATETIME  NULL,
    [TxtErreur]     VARCHAR (500)  NULL,
    [LstVariable]   VARCHAR (1000) NULL,
    [LibMessage]    VARCHAR (100)  NULL,
    [TxtMessage]    VARCHAR (4000) NULL,
    [NivPriorite]   TINYINT        CONSTRAINT [DF_Gen_MsgMessage_NivPriorite] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Gen_MsgMessage] PRIMARY KEY CLUSTERED ([CleMessage] ASC)
);

