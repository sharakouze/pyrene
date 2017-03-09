CREATE TABLE [Gen].[TiersIdent]
(
    [CleIdent] INT NOT NULL IDENTITY,
    [CleTiers] INT NOT NULL,
    [CleTypeIdent] INT NOT NULL,
    [NumIdent] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_TiersIdent] PRIMARY KEY ([CleIdent]),
    CONSTRAINT [UK_TiersIdent_CleTiers_CleTypeIdent] UNIQUE ([CleTiers], [CleTypeIdent]),
    CONSTRAINT [FK_TiersIdent_CleTiers] FOREIGN KEY ([CleTiers]) REFERENCES [Gen].[Tiers] ([CleTiers]) ON DELETE CASCADE,
    CONSTRAINT [FK_TiersIdent_CleTypeIdent] FOREIGN KEY ([CleTypeIdent]) REFERENCES [Gen].[TypeIdent] ([CleTypeIdent])
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du tiers parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = N'CleTiers'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du type d''identifiant.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = N'CleTypeIdent'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numéro de l''identifiant.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'TiersIdent',
    @level2type = N'COLUMN',
    @level2name = N'NumIdent'