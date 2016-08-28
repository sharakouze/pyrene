CREATE TABLE [GenSecteur]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100)  NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [GenSocieteId] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenSocieteSecteur] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenSocieteSecteur_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [FK_GenSocieteSecteur_GenSocieteId] FOREIGN KEY ([GenSocieteId]) REFERENCES [GenSociete] ([Id]) ON DELETE CASCADE,
);

GO

CREATE INDEX [IX_GenSocieteSecteur_LibObjet] ON [GenSecteur] ([LibObjet]);

GO

CREATE INDEX [IX_GenSocieteSecteur_GenSocieteId] ON [GenSecteur] ([GenSocieteId]);
