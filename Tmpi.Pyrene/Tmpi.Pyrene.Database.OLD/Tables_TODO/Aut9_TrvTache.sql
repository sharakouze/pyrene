CREATE TABLE [SA_TMPI].[Aut9_TrvTache] (
    [CleTravail]       INT          NULL,
    [CleEchantillon]   INT          NULL,
    [NumPlaque_S]      INT          NULL,
    [NumLigne_S]       TINYINT      NOT NULL,
    [NumColonne_S]     TINYINT      NOT NULL,
    [PosEchantillon_S] SMALLINT     NULL,
    [PrfPlaque_C]      VARCHAR (10) NULL,
    [NumPlaque_C]      INT          NULL,
    [PosEchantillon_C] SMALLINT     NULL,
    [NumLigne_C]       TINYINT      NOT NULL,
    [NumColonne_C]     TINYINT      NOT NULL,
    [CleFeuille]       INT          NULL,
    [CleDosParametre]  INT          NULL,
    [VolPreleve]       SMALLINT     NULL,
    [CleErreur]        SMALLINT     NULL
);

