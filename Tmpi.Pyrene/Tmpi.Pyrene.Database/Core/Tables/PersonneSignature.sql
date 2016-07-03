CREATE TABLE [Core].[PersonneSignature]
(
	[ClePersonne] INT NOT NULL,
    [ImgSignature] VARBINARY(MAX) NOT NULL,
    [ImgType] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_PersonneSignature] PRIMARY KEY ([ClePersonne]), 
    CONSTRAINT [FK_PersonneSignature_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Core].[Personne]([ClePersonne]),
);
