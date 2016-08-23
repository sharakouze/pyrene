CREATE TABLE [GenTiers]
(
    [CleTiers] INT IDENTITY NOT NULL,
    [NumTiers] VARCHAR(100) NOT NULL,
    [NomTiers] VARCHAR(200) NOT NULL,
    [TxtTiers] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [AdrLatitude] DECIMAL(9,6) NULL,
    [AdrLongitude] DECIMAL(9,6) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [CodCompta] VARCHAR(100) NULL,


    [NumInsee] VARCHAR (25)     NULL,
     [CleTypIdent] SMALLINT         CONSTRAINT [DF_Gen_TrsTiers_CleTypIdent] DEFAULT ((0)) NOT NULL,
    [AdrVilleSuite] VARCHAR (50)     NULL,
    [CleCivilite] SMALLINT         NULL,
    [CleLangue] SMALLINT         NULL,
    [ClePointP] INT              NULL,
    [ClePropriete1] SMALLINT         NULL,
    [ClePropriete2] SMALLINT         NULL,
    [ClePropriete3] SMALLINT         NULL,

    CONSTRAINT [PK_GenTiers] PRIMARY KEY ([CleTiers]),
    CONSTRAINT [UN_GenTiers_NumTiers] UNIQUE ([NumTiers])
);

GO

CREATE INDEX [IX_GenTiers_NomTiers] ON [GenTiers] ([NomTiers]);
