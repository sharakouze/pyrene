CREATE TABLE [SA_TMPI].[Sto_IcoValidation] (
    [CleCommande]   INT            NOT NULL,
    [CleMandat]     INT            NOT NULL,
    [NumMandataire] TINYINT        NULL,
    [CleMandataire] INT            NULL,
    [TxtMandataire] VARCHAR (4000) NULL,
    [DatValidation] SMALLDATETIME  NULL
);

