CREATE TABLE [Gmao].[AtelierResponsable]
(
	[CleAtelier] INT NOT NULL, 
    [ClePersonne] INT NOT NULL,
	CONSTRAINT [PK_AtelierResponsable] PRIMARY KEY ([CleAtelier], [ClePersonne]), 
    CONSTRAINT [FK_AtelierResponsable_CleAtelier] FOREIGN KEY ([CleAtelier]) REFERENCES [Gmao].[Atelier] ([CleAtelier]), 
    CONSTRAINT [FK_AtelierResponsable_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Core].[Personne] ([ClePersonne]),
)
