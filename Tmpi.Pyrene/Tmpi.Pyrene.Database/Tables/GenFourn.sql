CREATE TABLE [GenFourn]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
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
    [TypModeReglement] INT NULL,
    [EstEnvoiMailBonCde] BIT NOT NULL,
    [CleGenPersonne] INT NULL,
    CONSTRAINT [PK_GenFourn] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenFourn_CodObjet] UNIQUE ([CodObjet]), 
    CONSTRAINT [FK_GenFourn_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id])
);

GO

CREATE INDEX [IX_GenFourn_LibObjet] ON [GenFourn] ([LibObjet]);
