CREATE TABLE [GenPersonneProfil]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenPersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_GenPersonneProfil_CodProfil_CleGenPersonne] UNIQUE ([CodProfil], [CleGenPersonne]), 
    CONSTRAINT [UK_GenPersonneProfil_CleGenPersonne_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([CleGenPersonne], [CleGenSociete], [CleGenSecteur], [CleGenService]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);
