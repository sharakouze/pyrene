CREATE TABLE [SA_TMPI].[Bud_EfaPaiementLigne] (
    [CleEfaPaiement]      INT             NOT NULL,
    [CleEfaPaiementLigne] INT             IDENTITY (1, 1) NOT NULL,
    [NumPaiement]         VARCHAR (25)    NULL,
    [MntPaiement]         DECIMAL (15, 2) NOT NULL,
    [NumAcompte]          TINYINT         NULL,
    [CleImputation]       SMALLINT        NULL
);

