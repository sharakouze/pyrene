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
    [CleGenSociete] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrVille] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenSecteur] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenSecteur_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [FK_GenSecteur_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]) ON DELETE CASCADE,
);

GO

CREATE INDEX [IX_GenSecteur_LibObjet] ON [GenSecteur] ([LibObjet]);

GO

CREATE INDEX [IX_GenSecteur_CleGenSociete] ON [GenSecteur] ([CleGenSociete]);
