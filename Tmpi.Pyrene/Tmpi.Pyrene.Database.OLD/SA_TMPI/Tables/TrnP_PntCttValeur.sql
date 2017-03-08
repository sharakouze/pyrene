CREATE TABLE [SA_TMPI].[TrnP_PntCttValeur] (
    [ClePntContrainte] INT           NOT NULL,
    [CleCttValeur]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodValeur]        VARCHAR (50)  NOT NULL,
    [LibValeur]        VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_TrnP_PntCttValeur] PRIMARY KEY CLUSTERED ([CleCttValeur] ASC),
    CONSTRAINT [FK1_TrnP_PntCttValeur] FOREIGN KEY ([ClePntContrainte]) REFERENCES [SA_TMPI].[TrnP_PntCttContrainte] ([ClePntContrainte]),
    CONSTRAINT [UN_TrnP_PntCttValeur] UNIQUE NONCLUSTERED ([ClePntContrainte] ASC, [CodValeur] ASC)
);

