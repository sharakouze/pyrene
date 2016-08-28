CREATE TABLE [GenPersonne]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(100) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [PrePersonne] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenPersonne] PRIMARY KEY ([Id]),
    CONSTRAINT [UN_GenPersonne_CodObjet] UNIQUE ([CodObjet])
);

GO

CREATE INDEX [IX_GenPersonne_LibObjet] ON [GenPersonne] ([LibObjet]);
