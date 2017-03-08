CREATE TABLE [SA_TMPI].[Sto_SttDestockage] (
    [CleSociete]        SMALLINT        NOT NULL,
    [CleSecteur]        SMALLINT        NOT NULL,
    [CleService]        SMALLINT        NOT NULL,
    [CleOperateur]      SMALLINT        NOT NULL,
    [CleMagasin]        SMALLINT        NOT NULL,
    [CleMagasinClient]  SMALLINT        NULL,
    [CleAffectation]    SMALLINT        NULL,
    [DatDestockage]     SMALLDATETIME   NOT NULL,
    [CodArticle]        VARCHAR (100)   NULL,
    [LibArticle]        VARCHAR (200)   NULL,
    [RefArticle]        VARCHAR (100)   NULL,
    [QteDestockee]      DECIMAL (15, 3) NOT NULL,
    [CodUnite]          VARCHAR (50)    NULL,
    [PrxUnitaire]       DECIMAL (15, 3) NOT NULL,
    [EstUnTransfert]    BIT             NOT NULL,
    [CleLivLigne]       INT             NULL,
    [CleDstLigne]       INT             NULL,
    [CleImputation]     SMALLINT        NULL,
    [CleNomenclature]   SMALLINT        NULL,
    [CleArticle]        INT             NULL,
    [CleDestockage]     INT             IDENTITY (1, 1) NOT NULL,
    [DatEnregistrement] SMALLDATETIME   CONSTRAINT [DF_Sto_SttDestockage_DatEnregistrement] DEFAULT (getdate()) NOT NULL,
    [ValCritere]        VARCHAR (100)   NULL,
    [CleMarche]         SMALLINT        NULL,
    CONSTRAINT [PK_Sto_SttDestockage] PRIMARY KEY CLUSTERED ([CleDestockage] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleSociete] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleService] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleOperateur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleMagasin] ASC);


GO
CREATE NONCLUSTERED INDEX [ID6_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CleAffectation] ASC);


GO
CREATE NONCLUSTERED INDEX [ID7_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([CodArticle] ASC);


GO
CREATE NONCLUSTERED INDEX [ID8_Sto_SttDestockage]
    ON [SA_TMPI].[Sto_SttDestockage]([LibArticle] ASC);

