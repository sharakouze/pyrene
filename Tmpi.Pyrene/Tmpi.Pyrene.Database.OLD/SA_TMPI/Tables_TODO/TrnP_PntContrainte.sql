CREATE TABLE [SA_TMPI].[TrnP_PntContrainte] (
    [ClePoint]         INT           NOT NULL,
    [ClePntContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [TypContrainte]    TINYINT       NULL,
    [CleContrainte]    SMALLINT      NULL,
    [LstValeur]        VARCHAR (100) NULL,
    CONSTRAINT [PK_TrnP_PntContrainte] PRIMARY KEY CLUSTERED ([ClePntContrainte] ASC),
    CONSTRAINT [FK1_TrnP_PntContrainte] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint])
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_PntContrainte]
    ON [SA_TMPI].[TrnP_PntContrainte]([ClePoint] ASC);

