CREATE TABLE [SA_TMPI].[Edi_ImpImport] (
    [CleImport]      INT           IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT       NOT NULL,
    [NomFichier]     VARCHAR (255) NOT NULL,
    [DatCreation]    SMALLDATETIME NOT NULL,
    [CleCreateur]    INT           NOT NULL,
    CONSTRAINT [PK_Edi_ImpImport] PRIMARY KEY CLUSTERED ([CleImport] ASC)
);

