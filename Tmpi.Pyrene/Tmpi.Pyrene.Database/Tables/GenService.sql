CREATE TABLE [GenService]
(
    [CleService] INT NOT NULL IDENTITY,
    [CodService] VARCHAR(100)  NOT NULL,
    [LibService] VARCHAR(200) NOT NULL,
    [TxtService] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [CleServiceParent] INT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenService] PRIMARY KEY ([CleService]),
    CONSTRAINT [UK_GenService_CodService] UNIQUE ([CodService]),
    CONSTRAINT [FK_GenService_CleServiceParent] FOREIGN KEY ([CleServiceParent]) REFERENCES [GenService] ([CleService]),
);

GO

CREATE INDEX [IX_GenService_CleServiceParent] ON [GenService] ([CleServiceParent]);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Clé du service parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenService',
    @level2type = N'COLUMN',
    @level2name = 'CleServiceParent'