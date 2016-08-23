CREATE TABLE [GenMandat]
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
    CONSTRAINT [PK_GenMandat] PRIMARY KEY ([CleMandat]),
    CONSTRAINT [UN_GenMandat_CodMandat_1] UNIQUE ([CodMandat], [NivMandat]),
    CONSTRAINT [UN_GenMandat_TypMandat_1] UNIQUE ([TypMandat], [NivMandat]),
);

GO

CREATE INDEX [IX_GenMandat_LibMandat] ON [GenMandat] ([LibMandat]);
