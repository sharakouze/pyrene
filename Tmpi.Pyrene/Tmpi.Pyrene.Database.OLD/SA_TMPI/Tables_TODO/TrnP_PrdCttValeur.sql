CREATE TABLE [SA_TMPI].[TrnP_PrdCttValeur] (
    [ClePrdContrainte] SMALLINT      NOT NULL,
    [CleCttValeur]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodValeur]        VARCHAR (50)  NOT NULL,
    [LibValeur]        VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_TrnP_PrdCttValeur] PRIMARY KEY CLUSTERED ([CleCttValeur] ASC),
    CONSTRAINT [FK1_TrnP_PrdCttValeur] FOREIGN KEY ([ClePrdContrainte]) REFERENCES [SA_TMPI].[LmsP_PrdCttContrainte] ([ClePrdContrainte]),
    CONSTRAINT [UN_TrnP_PrdCttValeur] UNIQUE NONCLUSTERED ([ClePrdContrainte] ASC, [CodValeur] ASC)
);

