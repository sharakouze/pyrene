CREATE TABLE [SA_TMPI].[TrnP_ItvCttValeur] (
    [CleItvContrainte] SMALLINT      NOT NULL,
    [CleCttValeur]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodValeur]        VARCHAR (50)  NOT NULL,
    [LibValeur]        VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_TrnP_ItvCttValeur] PRIMARY KEY CLUSTERED ([CleCttValeur] ASC),
    CONSTRAINT [FK1_TrnP_ItvCttValeur] FOREIGN KEY ([CleItvContrainte]) REFERENCES [SA_TMPI].[TrnP_ItvCttContrainte] ([CleItvContrainte]),
    CONSTRAINT [UN_TrnP_ItvCttValeur] UNIQUE NONCLUSTERED ([CleItvContrainte] ASC, [CodValeur] ASC)
);

