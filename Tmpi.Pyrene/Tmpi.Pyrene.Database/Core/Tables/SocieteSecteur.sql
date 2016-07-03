CREATE TABLE [Core].[SocieteSecteur]
(
    [CleSecteur] INT NOT NULL IDENTITY,
    [CodSecteur] VARCHAR(100)  NOT NULL,
    [LibSecteur] VARCHAR(200) NOT NULL,
    [TxtSecteur] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [IdExterne] VARCHAR(100) NULL,
    [CleSociete] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10)  NULL,
    [AdrVille] VARCHAR(100)  NULL,
    [NumTelep] VARCHAR(25)  NULL,
    [NumTelec] VARCHAR(25)  NULL,
    [NumEmail] VARCHAR(100)  NULL,
    CONSTRAINT [PK_SocieteSecteur] PRIMARY KEY ([CleSecteur]),
    CONSTRAINT [UN_SocieteSecteur_CodSecteur] UNIQUE ([CodSecteur]),
    CONSTRAINT [FK_SocieteSecteur_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [Core].[Societe] ([CleSociete]),
);

GO

CREATE INDEX [IX_SocieteSecteur_LibSecteur] ON [Core].[SocieteSecteur] ([LibSecteur]);
