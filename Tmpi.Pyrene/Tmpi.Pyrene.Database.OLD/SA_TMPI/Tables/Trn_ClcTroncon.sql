CREATE TABLE [SA_TMPI].[Trn_ClcTroncon] (
    [ClePoint_01]     INT             NOT NULL,
    [ClePoint_02]     INT             NOT NULL,
    [AdrLongitude_01] DECIMAL (12, 8) NOT NULL,
    [AdrLatitude_01]  DECIMAL (12, 8) NOT NULL,
    [AdrLongitude_02] DECIMAL (12, 8) NOT NULL,
    [AdrLatitude_02]  DECIMAL (12, 8) NOT NULL,
    [DstTroncon]      DECIMAL (10, 3) NOT NULL,
    [DurTroncon]      DECIMAL (10, 3) NOT NULL,
    [AdrCommune_01]   VARCHAR (50)    NULL,
    [AdrCommune_02]   VARCHAR (50)    NULL,
    [DatCreation]     SMALLDATETIME   CONSTRAINT [DF_Trn_ClcTroncon_DatCreation] DEFAULT (getdate()) NOT NULL,
    [DatConsultation] SMALLDATETIME   NULL,
    CONSTRAINT [PK_Trn_ClcDistance] PRIMARY KEY CLUSTERED ([AdrLatitude_01] ASC, [AdrLatitude_02] ASC, [AdrLongitude_01] ASC, [AdrLongitude_02] ASC)
);

