CREATE TABLE [SA_TMPI].[Gen_TrcTrace] (
    [CleTrace]     INT            IDENTITY (1, 1) NOT NULL,
    [DatEvenement] SMALLDATETIME  NOT NULL,
    [CleEvenement] SMALLINT       NOT NULL,
    [TypObjet]     SMALLINT       NOT NULL,
    [CleObjet]     INT            NOT NULL,
    [TxtEvenement] VARCHAR (4000) NULL,
    [CleOperateur] SMALLINT       NOT NULL,
    [CleSecteur]   SMALLINT       NULL,
    [CleService]   SMALLINT       NULL
);

