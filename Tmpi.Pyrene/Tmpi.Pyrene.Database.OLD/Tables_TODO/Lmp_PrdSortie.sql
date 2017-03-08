CREATE TABLE [SA_TMPI].[Lmp_PrdSortie] (
    [ClePrdSortie]    INT      IDENTITY (1, 1) NOT NULL,
    [CleProduit]      SMALLINT NOT NULL,
    [CleEtat]         SMALLINT NULL,
    [CleExport]       SMALLINT NULL,
    [CleDestinataire] INT      CONSTRAINT [DF_Lmp_PrdSortie_CleDestinataire] DEFAULT ((0)) NULL,
    [NbrExemplaire]   INT      CONSTRAINT [DF_Lmp_PrdSortie_NbrExemplaire] DEFAULT ((1)) NOT NULL,
    [TypTiers]        TINYINT  NULL,
    [CleMFeuille]     SMALLINT NULL,
    CONSTRAINT [FK2_Lmp_PrdSortie] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat])
);

