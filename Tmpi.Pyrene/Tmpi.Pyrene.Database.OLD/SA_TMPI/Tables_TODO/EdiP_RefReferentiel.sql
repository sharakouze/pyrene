CREATE TABLE [SA_TMPI].[EdiP_RefReferentiel] (
    [CleReferentiel]    INT           IDENTITY (1, 1) NOT NULL,
    [CleObjReferentiel] TINYINT       NOT NULL,
    [TypReferentiel]    TINYINT       NOT NULL,
    [DatMaj]            SMALLDATETIME NULL,
    [CleOperateur]      SMALLINT      NOT NULL,
    [EstInstalle]       BIT           CONSTRAINT [DF_EdiP_RefReferentiel_EstInstalle] DEFAULT ((0)) NOT NULL,
    [CleSI]             INT           CONSTRAINT [DF_EdiP_RefReferentiel_CleSI] DEFAULT ((0)) NOT NULL,
    [NomReferentiel]    VARCHAR (255) NULL,
    CONSTRAINT [PK_EdiP_RefReferentiel] PRIMARY KEY CLUSTERED ([CleReferentiel] ASC) WITH (FILLFACTOR = 90)
);

