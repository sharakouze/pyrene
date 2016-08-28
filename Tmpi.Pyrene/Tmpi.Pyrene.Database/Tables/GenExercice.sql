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
    CONSTRAINT [UN_GenExercice_CodObjet] UNIQUE ([CodObjet]),
);

GO

CREATE INDEX [IX_GenExercice_LibObjet] ON [GenExercice] ([LibObjet]);
