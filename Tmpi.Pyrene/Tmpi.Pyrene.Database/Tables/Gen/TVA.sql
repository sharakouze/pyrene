CREATE TABLE [Gen].[TVA]
(
    [CleTVA] INT IDENTITY NOT NULL,
    [CodTVA] VARCHAR(100) NOT NULL,
    [LibTVA] VARCHAR(200) NOT NULL,
    [TxtTVA] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TauTVA] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_TVA] PRIMARY KEY ([CleTVA]),
    CONSTRAINT [UK_TVA_CodTVA] UNIQUE ([CodTVA])
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Taux de TVA.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TVA',
    @level2type = N'COLUMN',
    @level2name = N'TauTVA'