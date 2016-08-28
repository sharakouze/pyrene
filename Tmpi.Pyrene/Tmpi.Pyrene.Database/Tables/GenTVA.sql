CREATE TABLE [GenTVA]
(
    [Id] INT IDENTITY NOT NULL,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [TauTVA] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_GenTVA] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenTVA_CodObjet] UNIQUE ([CodObjet])
);

GO

CREATE INDEX [IX_GenTVA_LibObjet] ON [GenTVA] ([LibObjet]);
