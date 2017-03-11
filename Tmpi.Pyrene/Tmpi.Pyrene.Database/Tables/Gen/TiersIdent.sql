CREATE TABLE [Gen].[TiersIdent]
(
    [Id] INT NOT NULL IDENTITY,
    [TiersId] INT NOT NULL,
    [TypeIdentId] INT NOT NULL,
    [NumIdent] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_TiersIdent] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_TiersIdent_TiersId_TypeIdentId] UNIQUE ([TiersId], [TypeIdentId]),
    CONSTRAINT [FK_TiersIdent_TiersId] FOREIGN KEY ([TiersId]) REFERENCES [Gen].[Tiers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TiersIdent_TypeIdentId] FOREIGN KEY ([TypeIdentId]) REFERENCES [Gen].[TypeIdent] ([Id])
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du tiers parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = 'TiersId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du type d''identifiant.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = 'TypeIdentId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numéro de l''identifiant.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = N'NumIdent'