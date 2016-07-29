CREATE TABLE [Sto].[Fourn]
(
    [CleFourn] INT NOT NULL IDENTITY,
    [CodFourn] VARCHAR(100) NOT NULL,
    [LibFourn] VARCHAR(200) NOT NULL,
    [TxtFourn] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumTelec] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [CodCompta] VARCHAR(100) NULL,
    [NumClient] VARCHAR(100) NULL,
    [NumTVAIntra] VARCHAR(25) NULL,
    [MntFPort] DECIMAL(15,2) NULL,
    [MntFPortGratuit] DECIMAL(15,2) NULL,
    [MntCommandeMin] DECIMAL(15,2) NULL,
    [DelLivraison] TINYINT NULL,
    [DelPaiement] TINYINT NULL,
    [ValNote] DECIMAL(5,2) NULL,
    [TypModeReglement] TINYINT NULL,
    [EstEnvoiMailBonCde] BIT NOT NULL,
    [CleProprietaire] INT NULL,
    CONSTRAINT [PK_Fourn] PRIMARY KEY ([CleFourn]),
    CONSTRAINT [UN_Fourn_CodFourn] UNIQUE ([CodFourn]), 
    CONSTRAINT [FK_Fourn_CleProprietaire] FOREIGN KEY ([CleProprietaire]) REFERENCES [Gen].[Personne]([ClePersonne])
);

GO

CREATE INDEX [IX_Fourn_LibFourn] ON [Sto].[Fourn] ([LibFourn]);
