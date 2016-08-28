CREATE TABLE [GenPersonneProfil]
(
    [Id] INT NOT NULL IDENTITY,
    [GenPersonneId] INT NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [GenSocieteId] INT NULL,
    [GenSecteurId] INT NULL,
    [GenServiceId] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([Id]), 
    CONSTRAINT [UN_GenPersonneProfil_CodProfil_1] UNIQUE ([CodObjet], [GenPersonneId]), 
    CONSTRAINT [UN_GenPersonneProfil_GenPersonneId_1] UNIQUE ([GenPersonneId], [GenSocieteId], [GenSecteurId], [GenServiceId]),
    CONSTRAINT [FK_GenPersonneProfil_GenPersonneId] FOREIGN KEY ([GenPersonneId]) REFERENCES [GenPersonne] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_GenSocieteId] FOREIGN KEY ([GenSocieteId]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_GenSecteurId] FOREIGN KEY ([GenSecteurId]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenPersonneProfil_GenServiceId] FOREIGN KEY ([GenServiceId]) REFERENCES [GenService] ([Id]),
);
