CREATE TABLE [GenFournBanque]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenFourn] INT NOT NULL,
    [CodIBAN] VARCHAR(34) NOT NULL,
    [CodBIC] VARCHAR(11) NOT NULL,
    [LibEtablissement] VARCHAR(200) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenFournBanque_CleGenFourn_CodIBAN] UNIQUE ([CleGenFourn], [CodIBAN]), 
    CONSTRAINT [FK_GenFournBanque_CleGenFourn] FOREIGN KEY ([CleGenFourn]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du fournisseur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'CleGenFourn'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de l''établissement bancaire.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'LibEtablissement'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'EstDefaut'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Code IBAN.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'CodIBAN'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Code BIC.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'CodBIC'