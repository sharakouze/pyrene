CREATE TABLE [CORE].[MandatMandataire]
(
    [CleMandataire] INT IDENTITY NOT NULL,
    [CleMandat] INT NOT NULL,
    [ClePersonne] INT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    CONSTRAINT [PK_MandatMandataire] PRIMARY KEY ([CleMandataire]),
    CONSTRAINT [UN_MandatMandataire_CleMandat] UNIQUE ([CleMandat] , [ClePersonne] , [CleSociete] , [CleSecteur] , [CleService]),
    CONSTRAINT [FK_MandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [CORE].[Mandat] ([CleMandat]) ON DELETE CASCADE,
    CONSTRAINT [FK_MandatMandataire_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [CORE].[Personne] ([ClePersonne]),
    CONSTRAINT [FK_MandatMandataire_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [CORE].[Societe] ([CleSociete]),
    CONSTRAINT [FK_MandatMandataire_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [CORE].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_MandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [CORE].[SocieteService] ([CleService]),
);
