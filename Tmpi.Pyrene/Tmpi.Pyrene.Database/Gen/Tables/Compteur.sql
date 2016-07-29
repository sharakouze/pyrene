CREATE TABLE [Gen].[Compteur] (
    [CleCompteur] INT NOT NULL IDENTITY,
    [CodCompteur] VARCHAR(100) NOT NULL,
    [LibCompteur] VARCHAR(200) NOT NULL,
    [TxtCompteur] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypCompteur] SMALLINT NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    [TypPeriodicite] TINYINT NOT NULL,
    [ValPrefixe1] VARCHAR (25) NULL,
    [ValFormatDate1] VARCHAR (25) NULL,
    [ValPrefixe2] VARCHAR(25) NULL,
    [NbrDigit] TINYINT NOT NULL,
    [ValSuffixe1] VARCHAR(25) NULL,
    [ValFormatDate2] VARCHAR(25) NULL,
    [ValSuffixe2] VARCHAR(25) NULL,
    [LstFormatMois] VARCHAR(500) NULL,
    CONSTRAINT [PK_Compteur] PRIMARY KEY ([CleCompteur]),
    CONSTRAINT [UN_Compteur_CodCompteur] UNIQUE ([CodCompteur]),
    CONSTRAINT [UN_Compteur_TypCompteur] UNIQUE ([TypCompteur], [CleSociete], [CleSecteur], [CleService]),
    CONSTRAINT [FK_Compteur_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [Gen].[Societe] ([CleSociete]),
    CONSTRAINT [FK_Compteur_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [Gen].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_Compteur_CleService] FOREIGN KEY ([CleService]) REFERENCES [Gen].[SocieteService] ([CleService]),
);


GO

CREATE INDEX [IX_Compteur_LibCompteur] ON [Gen].[Compteur] ([LibCompteur]);
