CREATE TABLE [SA_TMPI].[Fct_DevDevis] (
    [CleDevis]        INT           IDENTITY (1, 1) NOT NULL,
    [NumDevis]        VARCHAR (25)  NULL,
    [TxtDevis]        VARCHAR (500) NULL,
    [ClePrescripteur] SMALLINT      NULL,
    [CleClient]       SMALLINT      NULL,
    [ClePayeur]       SMALLINT      NULL,
    [CleOrgPreleveur] SMALLINT      NULL,
    [CleLaboratoire]  SMALLINT      NULL,
    [CleTarif]        SMALLINT      NOT NULL,
    [CleTarifVersion] INT           NOT NULL,
    [CleMotif]        SMALLINT      NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Fct_DevDevis_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModif]        SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [CleValideur]     SMALLINT      NULL,
    CONSTRAINT [PK_Fct_DevDevis] PRIMARY KEY CLUSTERED ([CleDevis] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Fct_DevDevis]
    ON [SA_TMPI].[Fct_DevDevis]([NumDevis] ASC);

