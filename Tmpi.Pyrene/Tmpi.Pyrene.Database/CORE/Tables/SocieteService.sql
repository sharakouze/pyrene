CREATE TABLE [CORE].[SocieteService]
(
    [CleService] INT NOT NULL IDENTITY,
    [CodService] VARCHAR(100)  NOT NULL,
    [LibService] VARCHAR(200) NOT NULL,
    [TxtService] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [CleSecteur] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_SocieteService] PRIMARY KEY ([CleService]),
    CONSTRAINT [UN_SocieteService_CodService] UNIQUE ([CodService]),
    CONSTRAINT [FK_SocieteService_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [CORE].[SocieteSecteur] ([CleSecteur]),
);

GO

CREATE INDEX [IX_SocieteService_LibService] ON [CORE].[SocieteService] ([LibService]);

GO

CREATE INDEX [IX_SocieteService_CleSecteur] ON [CORE].[SocieteService] ([CleSecteur]);
