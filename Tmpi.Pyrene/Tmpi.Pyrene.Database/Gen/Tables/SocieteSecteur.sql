CREATE TABLE [Gen].[SocieteSecteur]
(
    [CleSecteur] INT NOT NULL IDENTITY,
    [CodSecteur] VARCHAR(100)  NOT NULL,
    [LibSecteur] VARCHAR(200) NOT NULL,
    [TxtSecteur] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [CleSociete] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_SocieteSecteur] PRIMARY KEY ([CleSecteur]),
    CONSTRAINT [UN_SocieteSecteur_CodSecteur] UNIQUE ([CodSecteur]),
    CONSTRAINT [FK_SocieteSecteur_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [Gen].[Societe] ([CleSociete]),
);

GO

CREATE INDEX [IX_SocieteSecteur_LibSecteur] ON [Gen].[SocieteSecteur] ([LibSecteur]);

GO

CREATE INDEX [IX_SocieteSecteur_CleSociete] ON [Gen].[SocieteSecteur] ([CleSociete]);
