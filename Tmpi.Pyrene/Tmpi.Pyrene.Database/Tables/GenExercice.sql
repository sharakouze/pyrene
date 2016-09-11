CREATE TABLE [GenExercice]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [DatDebut] DATETIME NOT NULL,
    [DatFin] DATETIME NOT NULL,
    CONSTRAINT [PK_GenExercice] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_GenExercice_CodObjet] UNIQUE ([CodObjet]),
);

GO

CREATE INDEX [IX_GenExercice_LibObjet] ON [GenExercice] ([LibObjet]);

GO


EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date de début',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenExercice',
    @level2type = N'COLUMN',
    @level2name = N'DatDebut'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date de fin',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'GenExercice',
    @level2type = N'COLUMN',
    @level2name = N'DatFin'