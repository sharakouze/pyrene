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
    [CleGenSecteur] INT NOT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenService] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenService_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [FK_GenService_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]) ON DELETE CASCADE,
);

GO

CREATE INDEX [IX_GenService_CleGenSecteur] ON [GenService] ([CleGenSecteur]);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du secteur auquel appartient le service.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenService',
    @level2type = N'COLUMN',
    @level2name = N'CleGenSecteur'