CREATE TABLE [GenPersonneSignature]
(
    [ClePersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_GenPersonneSignature] PRIMARY KEY ([ClePersonne]), 
    CONSTRAINT [FK_GenPersonneSignature_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]) ON DELETE CASCADE,
);
