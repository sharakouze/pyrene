CREATE TABLE [SA_TMPI].[Aut_TrvTache] (
    [CleTravail]       INT          NULL,
    [CleEchantillon]   INT          NULL,
    [NumPlaque_S]      INT          NULL,
    [NumLigne_S]       TINYINT      CONSTRAINT [DF_Aut_TrvTache_NumLigne_S] DEFAULT ((0)) NOT NULL,
    [NumColonne_S]     TINYINT      CONSTRAINT [DF_Aut_TrvTache_NumColonne_S] DEFAULT ((0)) NOT NULL,
    [PosEchantillon_S] SMALLINT     NULL,
    [PrfPlaque_C]      VARCHAR (10) NULL,
    [NumPlaque_C]      INT          NULL,
    [PosEchantillon_C] SMALLINT     NULL,
    [NumLigne_C]       TINYINT      CONSTRAINT [DF_Aut_TrvTache_NumLigne_C] DEFAULT ((0)) NOT NULL,
    [NumColonne_C]     TINYINT      CONSTRAINT [DF_Aut_TrvTache_NumColonne_C] DEFAULT ((0)) NOT NULL,
    [CleFeuille]       INT          NULL,
    [CleDosParametre]  INT          NULL,
    [VolPreleve]       SMALLINT     NULL,
    [CleErreur]        SMALLINT     NULL,
    [VolAPrelever]     SMALLINT     NULL
);

