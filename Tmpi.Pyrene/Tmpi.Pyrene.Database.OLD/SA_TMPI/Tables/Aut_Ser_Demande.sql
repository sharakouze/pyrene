CREATE TABLE [SA_TMPI].[Aut_Ser_Demande] (
    [CleDemande]      INT           IDENTITY (1, 1) NOT NULL,
    [NumDemande]      VARCHAR (100) NULL,
    [CleDemande_LIMS] INT           NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Aut_Ser_Demande_DatCreation] DEFAULT (getdate()) NULL
);

