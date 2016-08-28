CREATE TABLE [GenMandatMandataire]
(
    [Id] INT IDENTITY NOT NULL,
    [GenMandatId] INT NOT NULL,
    [GenPersonneId] INT NOT NULL,
    [GenSocieteId] INT NULL,
    [GenSecteurId] INT NULL,
    [GenServiceId] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    CONSTRAINT [PK_GenMandatMandataire] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenMandatMandataire_GenMandatId_1] UNIQUE ([GenMandatId] , [GenPersonneId] , [GenSocieteId] , [GenSecteurId] , [GenServiceId]),
    CONSTRAINT [FK_GenMandatMandataire_GenMandatId] FOREIGN KEY ([GenMandatId]) REFERENCES [GenMandat] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenMandatMandataire_GenPersonneId] FOREIGN KEY ([GenPersonneId]) REFERENCES [GenPersonne] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_GenSocieteId] FOREIGN KEY ([GenSocieteId]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_GenSecteurId] FOREIGN KEY ([GenSecteurId]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenMandatMandataire_GenServiceId] FOREIGN KEY ([GenServiceId]) REFERENCES [GenService] ([Id]),
);
