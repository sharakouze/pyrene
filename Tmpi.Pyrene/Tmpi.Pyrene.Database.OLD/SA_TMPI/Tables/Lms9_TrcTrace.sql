CREATE TABLE [SA_TMPI].[Lms9_TrcTrace] (
    [CleTrace]     INT            IDENTITY (1, 1) NOT NULL,
    [DatEvenement] SMALLDATETIME  NOT NULL,
    [CleEvenement] SMALLINT       NOT NULL,
    [CleDossier]   INT            NOT NULL,
    [TxtEvenement] VARCHAR (4000) NULL,
    [CleOperateur] SMALLINT       NOT NULL,
    [CleSecteur]   SMALLINT       NULL,
    [CleService]   SMALLINT       NULL,
    [TypObjet]     SMALLINT       NOT NULL
);

