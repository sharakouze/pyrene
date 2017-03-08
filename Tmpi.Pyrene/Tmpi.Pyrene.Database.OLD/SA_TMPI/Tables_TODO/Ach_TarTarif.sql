CREATE TABLE [SA_TMPI].[Ach_TarTarif] (
    [CleFournisseur]      SMALLINT       NOT NULL,
    [CleTarif]            INT            IDENTITY (1, 1) NOT NULL,
    [CodTarif]            VARCHAR (50)   NOT NULL,
    [LibTarif]            VARCHAR (200)  NOT NULL,
    [TxtTarif]            VARCHAR (2000) NULL,
    [EstActif]            BIT            CONSTRAINT [DF_Ach_TarTarif_EstActif] DEFAULT ((0)) NOT NULL,
    [EstSuiviLot_Def]     BIT            CONSTRAINT [DF_Ach_TarTarif_EstSuiviLot_Def] DEFAULT ((0)) NOT NULL,
    [CleMarche]           SMALLINT       NULL,
    [CleNomenclature_Def] SMALLINT       NULL,
    [CleImputation_Def]   SMALLINT       NULL,
    [CleTva_Def]          SMALLINT       NULL,
    [CleMarche_Def]       SMALLINT       NULL,
    CONSTRAINT [PK_Ach_TarTarif] PRIMARY KEY CLUSTERED ([CleTarif] ASC),
    CONSTRAINT [UN_Ach_TarTarif] UNIQUE NONCLUSTERED ([CleFournisseur] ASC, [CodTarif] ASC)
);

