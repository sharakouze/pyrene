CREATE TABLE [Gen].[FournContact]
(
    [Id] INT NOT NULL IDENTITY,
    [FournId] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtObjet] VARCHAR(2000) NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypCivilite] INT NULL,
    [LibFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_FournContact] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_FournContact_FournId] FOREIGN KEY ([FournId]) REFERENCES [Gen].[Fourn] ([Id]) ON DELETE CASCADE, 
);

GO

CREATE INDEX [IX_FournContact_FournId] ON [Gen].[FournContact] ([FournId]);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Titre de civilité.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'FournContact',
    @level2type = N'COLUMN',
    @level2name = N'TypCivilite'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du fournisseur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'FournContact',
    @level2type = N'COLUMN',
    @level2name = 'FournId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de famille.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'FournContact',
    @level2type = N'COLUMN',
    @level2name = 'NomContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Prénom.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'FournContact',
    @level2type = N'COLUMN',
    @level2name = 'PreContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fonction ou poste du contact chez le fournisseur.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'FournContact',
    @level2type = N'COLUMN',
    @level2name = 'LibFonction'