CREATE TABLE [SA_TMPI].[Sto_LotComposant] (
    [CleLot]          INT             NOT NULL,
    [QteComposant]    DECIMAL (10, 4) CONSTRAINT [DF_Sto_LotComposant_QteComposant] DEFAULT ((0)) NULL,
    [CleComposant]    INT             NOT NULL,
    [DatValidation]   SMALLDATETIME   NULL,
    [CleValideur]     SMALLINT        NULL,
    [NumLot]          VARCHAR (50)    NULL,
    [CleLotComposant] INT             NULL,
    CONSTRAINT [PK_Sto_LotComposant] PRIMARY KEY CLUSTERED ([CleLot] ASC, [CleComposant] ASC),
    CONSTRAINT [FK1_Sto_LotComposant] FOREIGN KEY ([CleLot]) REFERENCES [SA_TMPI].[t_Lot] ([CleLot]),
    CONSTRAINT [FK2_Sto_LotComposant] FOREIGN KEY ([CleComposant]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_LotComposant]
    ON [SA_TMPI].[Sto_LotComposant]([CleLot] ASC);

