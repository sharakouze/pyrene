CREATE TABLE [Gen].[TVA]
(
    [Id] INT IDENTITY NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TauTVA] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_TVA] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_TVA_CodObjet] UNIQUE ([CodObjet])
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