CREATE TABLE [GenPersonneSignature]
(
    [GenPersonneId] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [TypMime] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_GenPersonneSignature] PRIMARY KEY ([GenPersonneId]), 
    CONSTRAINT [FK_GenPersonneSignature_GenPersonneId] FOREIGN KEY ([GenPersonneId]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
);
