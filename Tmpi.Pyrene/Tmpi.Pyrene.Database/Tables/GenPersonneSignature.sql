CREATE TABLE [GenPersonneSignature]
(
    [CleGenPersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_GenPersonneSignature] PRIMARY KEY ([CleGenPersonne]), 
    CONSTRAINT [FK_GenPersonneSignature_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Image de la signature.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneSignature',
    @level2type = N'COLUMN',
    @level2name = N'ImgSignature'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Type MIME de l''image.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneSignature',
    @level2type = N'COLUMN',
    @level2name = N'TypMime'