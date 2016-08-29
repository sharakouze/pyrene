CREATE TABLE [GenPersonneSignature]
(
    [CleGenPersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_GenPersonneSignature] PRIMARY KEY ([CleGenPersonne]), 
    CONSTRAINT [FK_GenPersonneSignature_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
);
