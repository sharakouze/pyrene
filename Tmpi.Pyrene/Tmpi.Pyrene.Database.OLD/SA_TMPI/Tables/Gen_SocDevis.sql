CREATE TABLE [SA_TMPI].[Gen_SocDevis] (
    [CleDevis]      INT            IDENTITY (1, 1) NOT NULL,
    [CodDevis]      NVARCHAR (50)  NULL,
    [LibDevis]      NVARCHAR (100) NULL,
    [TxtDevis]      NVARCHAR (255) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Gen_SocDevis_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Gen_SocDevis_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   INT            NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_Gen_SocDevis] PRIMARY KEY CLUSTERED ([CleDevis] ASC),
    CONSTRAINT [UN_Gen_SocDevis] UNIQUE NONCLUSTERED ([CleDevis] ASC, [CodDevis] ASC)
);

