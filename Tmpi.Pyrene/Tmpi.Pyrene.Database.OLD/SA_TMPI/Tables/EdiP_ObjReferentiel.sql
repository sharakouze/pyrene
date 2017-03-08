CREATE TABLE [SA_TMPI].[EdiP_ObjReferentiel] (
    [CleObjReferentiel] TINYINT        NOT NULL,
    [TypReferentiel]    TINYINT        NOT NULL,
    [NumOrdre]          TINYINT        NOT NULL,
    [CodReferentiel]    VARCHAR (50)   NULL,
    [NomObjInterne]     VARCHAR (50)   NOT NULL,
    [NomObjReferentiel] VARCHAR (50)   NOT NULL,
    [TxtObjReferentiel] VARCHAR (1000) NULL,
    CONSTRAINT [PK_EdiP_ObjReferentiel] PRIMARY KEY CLUSTERED ([CleObjReferentiel] ASC, [TypReferentiel] ASC) WITH (FILLFACTOR = 90)
);

