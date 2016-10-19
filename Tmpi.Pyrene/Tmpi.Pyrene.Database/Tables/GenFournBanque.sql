CREATE TABLE [GenFournBanque]
(
    [CleBanque] INT NOT NULL IDENTITY,
    [CleFourn] INT NOT NULL,
    [CodIBAN] VARCHAR(34) NOT NULL,
    [CodBIC] VARCHAR(11) NOT NULL,
    [LibEtablissement] VARCHAR(200) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [CleCreateur] INT NOT NULL,
    [DatEdition] DATETIME NULL,
    [CleEditeur] INT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([CleBanque]),
    CONSTRAINT [UK_GenFournBanque_CleFourn_CodIBAN] UNIQUE ([CleFourn], [CodIBAN]), 
    CONSTRAINT [FK_GenFournBanque_CleFourn] FOREIGN KEY ([CleFourn]) REFERENCES [GenFourn] ([CleFourn]) ON DELETE CASCADE
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du fournisseur parent',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = 'CleFourn'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de l''établissement bancaire',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'LibEtablissement'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'EstDefaut'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Code IBAN',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'CodIBAN'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Code BIC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournBanque',
    @level2type = N'COLUMN',
    @level2name = N'CodBIC'