CREATE TABLE [GenMandatMandataire]
(
    [CleMandataire] INT IDENTITY NOT NULL,
    [CleMandat] INT NOT NULL,
    [ClePersonne] INT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    CONSTRAINT [PK_GenMandatMandataire] PRIMARY KEY ([CleMandataire]),
    CONSTRAINT [UN_GenMandatMandataire_CleMandat_1] UNIQUE ([CleMandat] , [ClePersonne] , [CleSociete] , [CleSecteur] , [CleService]),
    CONSTRAINT [FK_GenMandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [GenMandat] ([CleMandat]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenMandatMandataire_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]),
    CONSTRAINT [FK_GenMandatMandataire_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]),
    CONSTRAINT [FK_GenMandatMandataire_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_GenMandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenSocieteService] ([CleService]),
);
