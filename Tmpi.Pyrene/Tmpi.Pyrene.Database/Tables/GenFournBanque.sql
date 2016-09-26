CREATE TABLE [GenFournBanque]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenFourn] INT NOT NULL,
    [NumRIB] VARCHAR(23) NOT NULL,
    [LibEtablissement] VARCHAR(200) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenFournBanque_CleGenFourn_RibBanque] UNIQUE ([CleGenFourn], [NumRIB]), 
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
    @value = N'Identifiant RIB.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = 'NumRIB'
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
    @value = N'Si true,',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'EstDefaut'