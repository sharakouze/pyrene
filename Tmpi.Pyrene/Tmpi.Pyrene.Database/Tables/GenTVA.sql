CREATE TABLE [GenTVA]
(
    [CleTVA] INT IDENTITY NOT NULL,
    [CodTVA] VARCHAR(100) NOT NULL,
    [LibTVA] VARCHAR(200) NOT NULL,
    [TxtTVA] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TauTVA] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_GenTVA] PRIMARY KEY ([CleTVA]),
    CONSTRAINT [UK_GenTVA_CodTVA] UNIQUE ([CodTVA])
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Taux de TVA.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenTVA',
    @level2type = N'COLUMN',
    @level2name = N'TauTVA'