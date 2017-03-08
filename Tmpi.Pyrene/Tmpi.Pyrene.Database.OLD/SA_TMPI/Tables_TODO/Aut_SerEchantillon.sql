CREATE TABLE [SA_TMPI].[Aut_SerEchantillon] (
    [NumPlaque]          INT           NULL,
    [CleDemande]         INT           NULL,
    [CleDossier]         INT           NULL,
    [CleSerEchantillon]  INT           IDENTITY (1, 1) NOT NULL,
    [PosEchantillon]     TINYINT       NULL,
    [CleDosEchantillon]  INT           NULL,
    [NumEchantillon_Int] VARCHAR (50)  NULL,
    [NumEchantillon_Ext] VARCHAR (50)  NULL,
    [QteInitiale]        SMALLINT      NULL,
    [DatCreation]        SMALLDATETIME CONSTRAINT [DF_Aut_SerEchantillon_DatCreation] DEFAULT (getdate()) NULL,
    [DatModification]    SMALLDATETIME NULL,
    [CleProduit]         SMALLINT      NULL,
    [CleErreur]          SMALLINT      NULL,
    [NumLigne]           SMALLINT      NOT NULL,
    [NumColonne]         SMALLINT      NOT NULL
);

