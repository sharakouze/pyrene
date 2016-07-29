CREATE TABLE [Gen].[Mandat]
(
    [CleMandat] INT NOT NULL IDENTITY,
    [CodMandat] VARCHAR(100) NOT NULL,
    [LibMandat] VARCHAR(200) NOT NULL,
    [TxtMandat] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TypMandat] SMALLINT NOT NULL,
    [NivMandat] TINYINT NOT NULL,
    [NbrSignature] TINYINT NOT NULL,
    [TxtMessage] VARCHAR(MAX) NULL,
    CONSTRAINT [PK_Mandat] PRIMARY KEY ([CleMandat]),
    CONSTRAINT [UN_Mandat_CodMandat] UNIQUE ([CodMandat], [NivMandat]),
    CONSTRAINT [UN_Mandat_TypMandat] UNIQUE ([TypMandat], [NivMandat]),
);

GO

CREATE INDEX [IX_Mandat_LibMandat] ON [Gen].[Mandat] ([LibMandat]);
