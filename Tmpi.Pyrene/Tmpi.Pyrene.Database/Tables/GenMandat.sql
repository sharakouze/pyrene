﻿CREATE TABLE [GenMandat]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypMandat] INT NOT NULL,
    [NivMandat] TINYINT NOT NULL,
    [NbrSignature] TINYINT NOT NULL,
    [TxtMessage] VARCHAR(MAX) NULL,
    CONSTRAINT [PK_GenMandat] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenMandat_CodObjet_NivMandat] UNIQUE ([CodObjet], [NivMandat]),
    CONSTRAINT [UK_GenMandat_TypMandat_NivMandat] UNIQUE ([TypMandat], [NivMandat]),
);

GO

CREATE INDEX [IX_GenMandat_LibObjet] ON [GenMandat] ([LibObjet]);