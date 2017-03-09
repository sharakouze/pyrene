CREATE TABLE [Gen].[Tiers]
(
    [CleTiers] INT NOT NULL IDENTITY,
    [NumTiers] VARCHAR(100) NOT NULL,
    [NomTiers] VARCHAR(200) NOT NULL,
    [TxtTiers] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,

    [AdrLatitude]   DECIMAL (9,6) NULL,
    [AdrLongitude]  DECIMAL (9,6) NULL,
    [AdrVilleSuite] VARCHAR (50)     NULL,
    [CodCompta]     VARCHAR (50)     NULL,
    [NumInsee]      VARCHAR (25)     NULL,
    [NomContact]    VARCHAR (50)     NULL,

    [CleCivilite]   SMALLINT         NULL,
    [CleLangue]     SMALLINT         NULL,
    [ClePointP]     INT              NULL,
    [ClePropriete1] SMALLINT         NULL,
    [ClePropriete2] SMALLINT         NULL,
    [ClePropriete3] SMALLINT         NULL,
	CONSTRAINT [PK_Tiers] PRIMARY KEY ([CleTiers]),
    CONSTRAINT [UK_Tiers] UNIQUE ([NumTiers])
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numéro interne.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Tiers',
    @level2type = N'COLUMN',
    @level2name = N'NumTiers'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Tiers',
    @level2type = N'COLUMN',
    @level2name = N'NomTiers'