CREATE TABLE [Gen].[PersonneSignature]
(
    [PersonneId] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_PersonneSignature] PRIMARY KEY ([PersonneId]), 
    CONSTRAINT [FK_PersonneSignature_PersonneId] FOREIGN KEY ([PersonneId]) REFERENCES [Gen].[Personne] ([Id]) ON DELETE CASCADE,
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Image de la signature.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneSignature',
    @level2type = N'COLUMN',
    @level2name = N'ImgSignature'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Type MIME de l''image.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneSignature',
    @level2type = N'COLUMN',
    @level2name = N'TypMime'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'PersonneSignature',
    @level2type = N'COLUMN',
    @level2name = 'PersonneId'