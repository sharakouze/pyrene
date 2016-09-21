﻿CREATE TABLE [GenPersonne]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [NomPersonne] VARCHAR(100) NOT NULL,
    [PrePersonne] VARCHAR(100) NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypCivilite] INT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenPersonne] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenPersonne_CodObjet] UNIQUE ([CodObjet])
);

GO

CREATE INDEX [IX_GenPersonne_LibObjet] ON [GenPersonne] ([NomPersonne]);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nom de famille',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonne',
    @level2type = N'COLUMN',
    @level2name = N'NomPersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Prénom',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonne',
    @level2type = N'COLUMN',
    @level2name = N'PrePersonne'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Titre de civilité',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenPersonne',
    @level2type = N'COLUMN',
    @level2name = 'TypCivilite'