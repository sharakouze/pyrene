CREATE TABLE [SA_TMPI].[Ach_TarImport] (
    [CleTarif]     SMALLINT      NOT NULL,
    [CleImport]    INT           IDENTITY (1, 1) NOT NULL,
    [DatImport]    SMALLDATETIME NOT NULL,
    [CodOperateur] VARCHAR (10)  NOT NULL
);

