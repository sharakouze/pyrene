CREATE TABLE [GenPersonneSignature]
(
    [ClePersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_GenPersonneSignature] PRIMARY KEY ([ClePersonne]), 
    CONSTRAINT [FK_GenPersonneSignature_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]) ON DELETE CASCADE,
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
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Clé de l''utilisateur parent.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonneSignature',
    @level2type = N'COLUMN',
    @level2name = N'ClePersonne'