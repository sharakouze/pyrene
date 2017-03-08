CREATE TABLE [SA_TMPI].[Aut_Ser_Dossier] (
    [CleDossier]      INT           IDENTITY (1, 1) NOT NULL,
    [NumDossier]      VARCHAR (100) NULL,
    [CleDossier_LIMS] INT           NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Aut_Ser_Dossier_DatCreation] DEFAULT (getdate()) NULL
);

