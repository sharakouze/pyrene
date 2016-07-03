CREATE TABLE [Core].[MandatMandataire]
(
    [CleMdtMandataire] INT IDENTITY (1, 1) NOT NULL,
    [CleMandat] INT NOT NULL,
    [CleMandataire] SMALLINT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    [EstSuspendu] BIT NOT NULL,
    CONSTRAINT [PK_MandatMandataire] PRIMARY KEY ([CleMdtMandataire]),
    CONSTRAINT [UN_MandatMandataire] UNIQUE ([CleMandat] , [CleMandataire] , [CleSociete] , [CleSecteur] , [CleService] ),
    CONSTRAINT [FK_MandatMandataire_CleMandat] FOREIGN KEY ([CleMandat]) REFERENCES [Core].[Mandat] ([CleMandat]) DELETE CASCADE,
    CONSTRAINT [FK_MandatMandataire_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [Core].[Societe] ([CleSociete]),
    CONSTRAINT [FK_MandatMandataire_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [Core].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_MandatMandataire_CleService] FOREIGN KEY ([CleService]) REFERENCES [Core].[SocieteService] ([CleService]),
);
