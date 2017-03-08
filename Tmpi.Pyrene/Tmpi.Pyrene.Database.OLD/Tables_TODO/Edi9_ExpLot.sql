CREATE TABLE [SA_TMPI].[Edi9_ExpLot] (
    [CleLot]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleExport]    SMALLINT      NOT NULL,
    [CleOperateur] SMALLINT      NOT NULL,
    [DatExport]    SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Edi9_ExpLot] PRIMARY KEY CLUSTERED ([CleLot] ASC),
    CONSTRAINT [FK1_Edi9_ExpLot] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport])
);

