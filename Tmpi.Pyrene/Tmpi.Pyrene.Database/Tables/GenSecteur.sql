CREATE TABLE [GenSecteur]
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
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenSecteur] PRIMARY KEY ([CleSecteur]),
    CONSTRAINT [UK_GenSecteur_CodSecteur] UNIQUE ([CodSecteur]),
    CONSTRAINT [FK_GenSecteur_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]) ON DELETE CASCADE,
);

GO

CREATE INDEX [IX_GenSecteur_CleSociete] ON [GenSecteur] ([CleSociete]);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Société à laquelle appartient le secteur.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenSecteur',
    @level2type = N'COLUMN',
    @level2name = 'CleSociete'