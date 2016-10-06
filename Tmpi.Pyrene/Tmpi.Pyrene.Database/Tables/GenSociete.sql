CREATE TABLE [GenSociete]
(
    [CleSociete] INT NOT NULL IDENTITY,
    [CodSociete] VARCHAR(100)  NOT NULL,
    [LibSociete] VARCHAR(200) NOT NULL,
    [TxtSociete] VARCHAR(500) NULL,
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
    CONSTRAINT [PK_GenSociete] PRIMARY KEY ([CleSociete]),
    CONSTRAINT [UK_GenSociete_CodSociete] UNIQUE ([CodSociete])
);
