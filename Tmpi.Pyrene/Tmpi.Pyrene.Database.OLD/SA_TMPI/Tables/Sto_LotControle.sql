CREATE TABLE [SA_TMPI].[Sto_LotControle] (
    [CleLot]         INT           NULL,
    [CleArtControle] INT           NULL,
    [DatValidation]  SMALLDATETIME NULL,
    [CleValideur]    SMALLINT      NULL,
    CONSTRAINT [FK1_Sto_LotControle] FOREIGN KEY ([CleLot]) REFERENCES [SA_TMPI].[t_Lot] ([CleLot]),
    CONSTRAINT [FK2_Sto_LotControle] FOREIGN KEY ([CleArtControle]) REFERENCES [SA_TMPI].[Sto_ArtControle] ([CleArtControle])
);

