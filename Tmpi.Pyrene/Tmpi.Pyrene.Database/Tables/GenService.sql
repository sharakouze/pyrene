CREATE TABLE [GenService]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100)  NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
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
    CONSTRAINT [PK_GenSocieteService] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenSocieteService_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [FK_GenSocieteService_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSecteur] ([Id]) ON DELETE CASCADE,
);

GO

CREATE INDEX [IX_GenService_LibObjet] ON [GenService] ([LibObjet]);

GO

CREATE INDEX [IX_GenService_CleSecteur] ON [GenService] ([CleSecteur]);
