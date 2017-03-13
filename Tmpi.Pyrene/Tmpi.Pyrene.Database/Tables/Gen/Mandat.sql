CREATE TABLE [Gen].[Mandat]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypMandat] INT NOT NULL,
    [NivMandat] TINYINT NOT NULL,
    [NbrSignature] TINYINT NOT NULL,
    [TxtMessage] VARCHAR(MAX) NULL,
    CONSTRAINT [PK_Mandat] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_Mandat_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [UK_Mandat_TypMandat_NivMandat] UNIQUE ([TypMandat], [NivMandat]),
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Type de mandat.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Mandat',
    @level2type = N'COLUMN',
    @level2name = N'TypMandat'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de signatures requises.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Mandat',
    @level2type = N'COLUMN',
    @level2name = N'NbrSignature'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Corps du message.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Mandat',
    @level2type = N'COLUMN',
    @level2name = N'TxtMessage'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Niveau du mandat.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Mandat',
    @level2type = N'COLUMN',
    @level2name = N'NivMandat'