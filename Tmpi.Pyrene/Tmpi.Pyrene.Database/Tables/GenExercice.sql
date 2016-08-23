CREATE TABLE [GenExercice]
(
    [CleExercice] INT NOT NULL IDENTITY,
    [CodExercice] VARCHAR(100) NOT NULL,
    [LibExercice] VARCHAR(200) NOT NULL,
    [TxtExercice] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [DatDebut] DATETIME NOT NULL,
    [DatFin] DATETIME NOT NULL,
    CONSTRAINT [PK_GenExercice] PRIMARY KEY ([CleExercice]), 
    CONSTRAINT [UN_GenExercice_CodExercice] UNIQUE ([CodExercice]),
);

GO

CREATE INDEX [IX_GenExercice_LibExercice] ON [GenExercice] ([LibExercice]);
