CREATE TABLE [SA_TMPI].[Sdr_DicLims] (
    [CleDictionnaire] INT           IDENTITY (1, 1) NOT NULL,
    [TypObjet]        TINYINT       NOT NULL,
    [CleSI]           INT           NOT NULL,
    [CleObjSource1]   INT           NOT NULL,
    [CleObjSource2]   INT           NOT NULL,
    [CleObjCible1]    INT           NOT NULL,
    [CleObjCible2]    INT           NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Sdr_DicLims_DatCreation] DEFAULT (getdate()) NOT NULL,
    [EstExclu]        BIT           CONSTRAINT [DF_Sdr_DicLims_EstExclu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sdr_DicLims] PRIMARY KEY CLUSTERED ([CleDictionnaire] ASC),
    CONSTRAINT [UN_Sdr_DicLims] UNIQUE NONCLUSTERED ([CleObjSource1] ASC, [CleObjSource2] ASC, [CleSI] ASC, [TypObjet] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sdr_DicLims]
    ON [SA_TMPI].[Sdr_DicLims]([TypObjet] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sdr_DicLims]
    ON [SA_TMPI].[Sdr_DicLims]([CleObjSource1] ASC);

