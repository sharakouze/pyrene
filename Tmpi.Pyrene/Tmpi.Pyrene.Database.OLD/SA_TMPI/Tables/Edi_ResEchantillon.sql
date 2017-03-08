CREATE TABLE [SA_TMPI].[Edi_ResEchantillon] (
    [CleDosEchantillon]  INT           NOT NULL,
    [CleDossier]         INT           NOT NULL,
    [CleDosPrelevement]  INT           NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon_Int] VARCHAR (50)  NOT NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [NumEtiquette]       VARCHAR (50)  NULL,
    [NumLot]             SMALLINT      NULL,
    [CleMatrice]         INT           NULL,
    [CleMatrice_Ref]     INT           NULL,
    [CleCauseNA]         INT           NULL,
    [CleCauseNA_Ref]     INT           NULL,
    [DatReception]       SMALLDATETIME NULL,
    [TxtEchantillon]     VARCHAR (255) NULL,
    CONSTRAINT [PK_Edi_ResEchantillon] PRIMARY KEY CLUSTERED ([CleDosEchantillon] ASC)
);

