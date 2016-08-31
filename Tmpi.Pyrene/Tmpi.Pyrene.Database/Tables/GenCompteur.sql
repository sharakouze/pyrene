﻿CREATE TABLE [GenCompteur] (
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypCompteur] INT NOT NULL,
    [CleGenSociete] INT NULL,
    [CleGenSecteur] INT NULL,
    [CleGenService] INT NULL,
    [TypPeriodicite] INT NOT NULL,
    [ValPrefixe1] VARCHAR (25) NULL,
    [ValFormatDate1] VARCHAR (25) NULL,
    [ValPrefixe2] VARCHAR(25) NULL,
    [NbrDigit] TINYINT NOT NULL,
    [ValSuffixe1] VARCHAR(25) NULL,
    [ValFormatDate2] VARCHAR(25) NULL,
    [ValSuffixe2] VARCHAR(25) NULL,
    [LstFormatMois] VARCHAR(500) NULL,
    CONSTRAINT [PK_GenCompteur] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenCompteur_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [UK_GenCompteur_TypCompteur_CleGenSociete_CleGenSecteur_CleGenService] UNIQUE ([TypCompteur], [CleGenSociete], [CleGenSecteur], [CleGenService]),
    CONSTRAINT [FK_GenCompteur_CleGenSociete] FOREIGN KEY ([CleGenSociete]) REFERENCES [GenSociete] ([Id]),
    CONSTRAINT [FK_GenCompteur_CleGenSecteur] FOREIGN KEY ([CleGenSecteur]) REFERENCES [GenSecteur] ([Id]),
    CONSTRAINT [FK_GenCompteur_CleGenService] FOREIGN KEY ([CleGenService]) REFERENCES [GenService] ([Id]),
);


GO

CREATE INDEX [IX_GenCompteur_LibObjet] ON [GenCompteur] ([LibObjet]);
