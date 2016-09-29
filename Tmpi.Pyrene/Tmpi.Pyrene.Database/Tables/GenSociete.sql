CREATE TABLE [GenSociete]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100)  NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenSociete] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenSociete_CodObjet] UNIQUE ([CodObjet])
);

GO

CREATE INDEX [IX_GenSociete_LibObjet] ON [GenSociete] ([LibObjet]);
