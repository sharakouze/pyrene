CREATE TABLE [SA_TMPI].[Sto_ArtLot] (
    [CleArticle]      INT           NOT NULL,
    [NumLot]          VARCHAR (50)  NOT NULL,
    [DatPeremptionAv] SMALLDATETIME NULL,
    [DatPeremptionAp] SMALLDATETIME NULL,
    [EstDestocke]     BIT           CONSTRAINT [DF_Sto_ArtLot_EstDestocke] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sto_ArtLot] PRIMARY KEY CLUSTERED ([CleArticle] ASC, [NumLot] ASC, [EstDestocke] ASC)
);

