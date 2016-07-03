CREATE TABLE [Core].[Mandat]
(
    [CleMandat] INT NOT NULL IDENTITY,
    [CodMandat] VARCHAR(100) NOT NULL,
    [LibMandat] VARCHAR(200) NOT NULL,
    [TxtMandat] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [IdExterne] VARCHAR(100) NOT NULL,
    [CleLogiciel] TINYINT NOT NULL,
    [TypMandat] TINYINT NOT NULL,
    [TxtMessage] VARCHAR(MAX) NULL,
    [NivMandat] TINYINT NOT NULL,
    [NbrSignature] TINYINT NOT NULL,
    CONSTRAINT [PK_Mandat] PRIMARY KEY ([CleMandat]),
    CONSTRAINT [UN_Mandat_TypMandat] UNIQUE ([TypMandat] ASC, [CodMandat] ASC),
    CONSTRAINT [UN_Mandat_NivMandat] UNIQUE ([NivMandat] ASC, [CodMandat] ASC)
);
