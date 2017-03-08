CREATE TABLE [SA_TMPI].[EdiP_DicDictionnaire] (
    [CleDictionnaire]   INT           IDENTITY (1, 1) NOT NULL,
    [TypRefSource]      TINYINT       NOT NULL,
    [TypRefCible]       TINYINT       NOT NULL,
    [CleObjReferentiel] TINYINT       NOT NULL,
    [CleSI]             INT           NOT NULL,
    [CleObjSource1]     INT           NOT NULL,
    [CleObjSource2]     INT           NOT NULL,
    [CleObjCible1]      INT           CONSTRAINT [DF_EdiP_DicDictionnaire_CleObjCible1] DEFAULT ((0)) NOT NULL,
    [CleObjCible2]      INT           CONSTRAINT [DF_EdiP_DicDictionnaire_CleObjCible2] DEFAULT ((0)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_EdiP_DicDictionnaire_DatCreation] DEFAULT (getdate()) NOT NULL,
    [DatTraduction]     SMALLDATETIME NULL,
    [EstExclu]          BIT           CONSTRAINT [DF_EdiP_DicDictionnaire_EstExclu] DEFAULT ((0)) NOT NULL,
    [EstATraduire]      BIT           CONSTRAINT [DF_EdiP_DicDictionnaire_EstATraduire] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EdiP_DicDictionnaire] PRIMARY KEY CLUSTERED ([CleDictionnaire] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [UN_EdiP_DicDictionnaire] UNIQUE NONCLUSTERED ([TypRefSource] ASC, [TypRefCible] ASC, [CleObjReferentiel] ASC, [CleObjSource1] ASC, [CleObjSource2] ASC, [CleSI] ASC) WITH (FILLFACTOR = 90)
);

