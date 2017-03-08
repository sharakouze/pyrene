CREATE TABLE [SA_TMPI].[Sdr_DicSandre] (
    [CleDictionnaire] INT           IDENTITY (1, 1) NOT NULL,
    [TypObjet]        TINYINT       NOT NULL,
    [CleSI]           INT           NOT NULL,
    [CleObjSource1]   INT           NOT NULL,
    [CleObjSource2]   INT           NOT NULL,
    [CleObjCible1]    INT           NOT NULL,
    [CleObjCible2]    INT           NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Sdr_DicSandre_DatCreation] DEFAULT (getdate()) NOT NULL,
    [EstExclu]        BIT           CONSTRAINT [DF_Sdr_DicSandre_EstExclu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sdr_DicSandre] PRIMARY KEY CLUSTERED ([CleDictionnaire] ASC),
    CONSTRAINT [UN_Sdr_DicSandre] UNIQUE NONCLUSTERED ([CleObjSource1] ASC, [CleObjSource2] ASC, [CleSI] ASC, [TypObjet] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sdr_DicSandre]
    ON [SA_TMPI].[Sdr_DicSandre]([TypObjet] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sdr_DicSandre]
    ON [SA_TMPI].[Sdr_DicSandre]([CleObjSource1] ASC);

