CREATE TABLE [SA_TMPI].[Ach_TarLigne] (
    [CleTarif]            SMALLINT        NOT NULL,
    [CleTarLigne]         INT             IDENTITY (1, 1) NOT NULL,
    [RefArticle]          VARCHAR (50)    NULL,
    [LibArticle]          VARCHAR (1000)  NOT NULL,
    [TxtArticle]          VARCHAR (4000)  NULL,
    [PrxUnitaire]         DECIMAL (12, 2) CONSTRAINT [DF_Ach_TarLigne_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauRemise]           DECIMAL (5, 2)  CONSTRAINT [DF_Ach_TarLigne_TauRemise] DEFAULT ((0)) NOT NULL,
    [CleArticle]          INT             NULL,
    [CleDomaine]          SMALLINT        NULL,
    [CleFamille]          SMALLINT        NULL,
    [CleSFamille]         SMALLINT        NULL,
    [CleImport]           SMALLINT        NULL,
    [MntEcoParticipation] DECIMAL (10, 4) CONSTRAINT [DF_Ach_TarLigne_MntEcoParticipation] DEFAULT ((0)) NOT NULL,
    [ValConditionL]       SMALLINT        CONSTRAINT [DF_Ach_TarLigne_ValConditionL] DEFAULT ((1)) NOT NULL,
    [ValConditionF]       SMALLINT        CONSTRAINT [DF_Ach_TarLigne_ValConditionF] DEFAULT ((1)) NOT NULL,
    [RefInterne]          VARCHAR (100)   NULL,
    [CleMarche]           SMALLINT        NULL,
    [CleNomenclature]     SMALLINT        NULL,
    [CleImputation]       SMALLINT        NULL,
    [CleTva]              SMALLINT        NOT NULL,
    [CleFouTarif]         INT             NULL,
    [EstSuiviLot]         BIT             CONSTRAINT [DF_Ach_TarLigne_EstSuiviLot] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ach_TarLigne] PRIMARY KEY CLUSTERED ([CleTarLigne] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleTarif] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleArticle] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleDomaine] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleFamille] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleSFamille] ASC);


GO
CREATE NONCLUSTERED INDEX [ID6_Ach_TarLigne]
    ON [SA_TMPI].[Ach_TarLigne]([CleImport] ASC);

