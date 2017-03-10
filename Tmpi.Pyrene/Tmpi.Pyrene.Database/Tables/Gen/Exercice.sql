CREATE TABLE [Gen].[Exercice]
(
	[CleExercice] INT NOT NULL IDENTITY,
	[CodExercice] VARCHAR(100) NOT NULL,
	[LibExercice] VARCHAR(200) NOT NULL,
	[TxtExercice] VARCHAR(2000) NULL,
	[EstActif] BIT NOT NULL,
	[DatCreation] DATETIME NOT NULL,
	[DatModif] DATETIME NULL,
	[CodExterne] VARCHAR(100) NULL,
	[DatDebut] DATETIME NOT NULL,
	[DatFin] DATETIME NOT NULL,
	CONSTRAINT [PK_Exercice] PRIMARY KEY ([CleExercice]), 
	CONSTRAINT [UK_Exercice_CodExercice] UNIQUE ([CodExercice]),
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date de début.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Exercice',
    @level2type = N'COLUMN',
    @level2name = N'DatDebut'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date de fin.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Exercice',
    @level2type = N'COLUMN',
    @level2name = N'DatFin'