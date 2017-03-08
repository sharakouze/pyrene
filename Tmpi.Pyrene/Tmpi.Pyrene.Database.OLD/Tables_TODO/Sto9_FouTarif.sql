CREATE TABLE [SA_TMPI].[Sto9_FouTarif] (
    [CleFournisseur] INT             NOT NULL,
    [CleArticle]     INT             NULL,
    [RefArticle]     VARCHAR (50)    NULL,
    [LibArticle]     VARCHAR (200)   NOT NULL,
    [CleUnite]       SMALLINT        NULL,
    [CleDevise]      TINYINT         NULL,
    [PrxUnitaire]    DECIMAL (15, 4) NOT NULL,
    [ValConditionB]  DECIMAL (10, 3) NOT NULL,
    [ValConditionL]  DECIMAL (10, 3) NOT NULL,
    [ValConditionF]  DECIMAL (10, 3) NOT NULL,
    [TauRemise]      DECIMAL (5, 2)  NOT NULL,
    [DelLivraison]   SMALLINT        NULL,
    [CleFabricant]   INT             NOT NULL,
    [CleMarche]      SMALLINT        NULL,
    [CleMarcheLot]   SMALLINT        NULL,
    [DatDebut]       SMALLDATETIME   NULL,
    [DatFin]         SMALLDATETIME   NULL,
    [NumLotM]        VARCHAR (50)    NULL,
    [DatArchivage]   SMALLDATETIME   NULL,
    [CleArchiveur]   SMALLINT        NULL
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto9_FouTarif]
    ON [SA_TMPI].[Sto9_FouTarif]([CleFournisseur] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto9_FouTarif]
    ON [SA_TMPI].[Sto9_FouTarif]([CleArticle] ASC) WITH (FILLFACTOR = 90);

