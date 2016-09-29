CREATE TABLE [GenFournContact]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenFourn] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypCivilite] INT NULL,
    [LibFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenFournContact] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_GenFournContact_CleGenFourn_NomContact] UNIQUE ([CleGenFourn], [NomContact]), 
    CONSTRAINT [FK_GenFournContact_CleGenFourn] FOREIGN KEY ([CleGenFourn]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE, 
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Titre de civilité.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournContact',
    @level2type = N'COLUMN',
    @level2name = N'TypCivilite'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Id du fournisseur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournContact',
    @level2type = N'COLUMN',
    @level2name = N'CleGenFourn'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de famille.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournContact',
    @level2type = N'COLUMN',
    @level2name = N'NomContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Prénom.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournContact',
    @level2type = N'COLUMN',
    @level2name = N'PreContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fonction ou poste du contact chez le fournisseur.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenFournContact',
    @level2type = N'COLUMN',
    @level2name = 'LibFonction'