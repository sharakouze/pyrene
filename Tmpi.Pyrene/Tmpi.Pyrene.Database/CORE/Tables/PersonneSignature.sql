CREATE TABLE [CORE].[PersonneSignature]
(
    [ClePersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_PersonneSignature] PRIMARY KEY ([ClePersonne]), 
    CONSTRAINT [FK_PersonneSignature_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [CORE].[Personne]([ClePersonne]) ON DELETE CASCADE,
);
