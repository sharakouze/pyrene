CREATE TABLE [Core].[Exercice]
(
    [CleExercice] INT NOT NULL IDENTITY,
    [CodExercice] VARCHAR(100)  NOT NULL,
    [LibExercice] VARCHAR(200) NOT NULL,
    [TxtExercice] VARCHAR(500) NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [IdExterne] VARCHAR(100) NULL,
    [NivExercice] TINYINT NOT NULL,
    [DatDebut] DATETIME NOT NULL,
    [DatFin] DATETIME NOT NULL,
    CONSTRAINT [PK_Exercice] PRIMARY KEY ([CleExercice]), 
    CONSTRAINT [UN_Exercice_CodExercice] UNIQUE ([CodExercice]),
);

GO

CREATE INDEX [IX_Exercice_LibExercice] ON [Core].[Exercice] ([LibExercice]);
