CREATE TABLE [Equ].[AtelierResponsable]
(
    [CleAtelier] INT NOT NULL, 
    [ClePersonne] INT NOT NULL,
    CONSTRAINT [PK_AtelierResponsable] PRIMARY KEY ([CleAtelier], [ClePersonne]), 
    CONSTRAINT [FK_AtelierResponsable_CleAtelier] FOREIGN KEY ([CleAtelier]) REFERENCES [Equ].[Atelier] ([CleAtelier]), 
    CONSTRAINT [FK_AtelierResponsable_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Gen].[Personne] ([ClePersonne]),
);
