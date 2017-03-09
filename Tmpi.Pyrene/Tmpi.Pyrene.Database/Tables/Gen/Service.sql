CREATE TABLE [Gen].[Service]
(
    [CleService] INT NOT NULL IDENTITY,
    [CodService] VARCHAR(100)  NOT NULL,
    [LibService] VARCHAR(200) NOT NULL,
    [TxtService] VARCHAR(2000) NULL,
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
    CONSTRAINT [PK_Service] PRIMARY KEY ([CleService]),
    CONSTRAINT [UK_Service_CodService] UNIQUE ([CodService]),
    CONSTRAINT [FK_Service_CleServiceParent] FOREIGN KEY ([CleServiceParent]) REFERENCES [Gen].[Service] ([CleService]),
);

GO

CREATE INDEX [IX_Service_CleServiceParent] ON [Gen].[Service] ([CleServiceParent]);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Service',
    @level2type = N'COLUMN',
    @level2name = 'CleServiceParent'