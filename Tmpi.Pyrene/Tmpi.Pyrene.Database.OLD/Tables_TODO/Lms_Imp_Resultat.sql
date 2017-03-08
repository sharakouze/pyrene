CREATE TABLE [SA_TMPI].[Lms_Imp_Resultat] (
    [CleDossier]        INT           NULL,
    [CleDosEchantillon] INT           NULL,
    [CleImportation]    INT           IDENTITY (1, 1) NOT NULL,
    [NumEchantillon]    VARCHAR (25)  NOT NULL,
    [LstResultat]       VARCHAR (500) NULL,
    [DatValidation]     SMALLDATETIME NULL,
    [CleValideur]       SMALLINT      NULL
);

