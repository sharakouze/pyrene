CREATE TABLE [GEN].[MandatMandataire]
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
    CONSTRAINT [FK_MandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [GEN].[Mandat] ([CleMandat]) ON DELETE CASCADE,
    CONSTRAINT [FK_MandatMandataire_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GEN].[Personne] ([ClePersonne]),
    CONSTRAINT [FK_MandatMandataire_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GEN].[Societe] ([CleSociete]),
    CONSTRAINT [FK_MandatMandataire_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GEN].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_MandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [GEN].[SocieteService] ([CleService]),
);
