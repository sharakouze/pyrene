CREATE TABLE [EQU].[AtelierResponsable]
(
	[CleAtelier] INT NOT NULL, 
    [ClePersonne] INT NOT NULL,
	CONSTRAINT [PK_AtelierResponsable] PRIMARY KEY ([CleAtelier], [ClePersonne]), 
    CONSTRAINT [FK_AtelierResponsable_CleAtelier] FOREIGN KEY ([CleAtelier]) REFERENCES [EQU].[Atelier] ([CleAtelier]), 
    CONSTRAINT [FK_AtelierResponsable_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [CORE].[Personne] ([ClePersonne]),
);
