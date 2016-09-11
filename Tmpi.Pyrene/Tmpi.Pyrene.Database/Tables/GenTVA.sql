CREATE TABLE [GenTVA]
(
    [Id] INT IDENTITY NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TauTVA] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_GenTVA] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenTVA_CodObjet] UNIQUE ([CodObjet])
);

GO

CREATE INDEX [IX_GenTVA_LibObjet] ON [GenTVA] ([LibObjet]);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Taux de TVA',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenTVA',
    @level2type = N'COLUMN',
    @level2name = N'TauTVA'