CREATE TABLE [Gen].[TiersContact]
(
    [CleContact] INT NOT NULL IDENTITY,
    [CleTiers] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtContact] VARCHAR(2000) NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypCivilite] INT NULL,
    [LibFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_TiersContact] PRIMARY KEY ([CleContact]), 
    CONSTRAINT [UK_TiersContact_CleTiers_NomContact] UNIQUE ([CleTiers], [NomContact]), 
    CONSTRAINT [FK_TiersContact_CleTiers] FOREIGN KEY ([CleTiers]) REFERENCES [Gen].[Tiers] ([CleTiers]) ON DELETE CASCADE, 
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du tiers parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersContact',
    @level2type = N'COLUMN',
    @level2name = N'CleTiers'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de famille.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersContact',
    @level2type = N'COLUMN',
    @level2name = N'NomContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Prénom.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersContact',
    @level2type = N'COLUMN',
    @level2name = N'PreContact'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Titre de civilité.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersContact',
    @level2type = N'COLUMN',
    @level2name = N'TypCivilite'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fonction ou poste du contact chez le tiers.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersContact',
    @level2type = N'COLUMN',
    @level2name = N'LibFonction'