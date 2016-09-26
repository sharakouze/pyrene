CREATE TABLE [GenMandatMandataire]
(
    [Id] INT IDENTITY NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CleGenMandat] INT NOT NULL,
    [CleGenPersonne] INT NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    CONSTRAINT [PK_GenMandatMandataire] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenMandatMandataire_CleGenMandat_CleGenPersonne_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([CleGenMandat] , [CleGenPersonne] , [CleGenSociete] , [CleGenSecteur] , [CleGenService]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenMandat] FOREIGN KEY ([CleGenMandat]) REFERENCES [GenMandat] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenMandatMandataire_CleGenPersonne] FOREIGN KEY ([CleGenPersonne]) REFERENCES [GenPersonne] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);
