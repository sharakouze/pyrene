CREATE TABLE [GenFournContact]
(
    [Id] INT NOT NULL IDENTITY,
    [GenFournId] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtContact] VARCHAR(500) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenFournContact] PRIMARY KEY ([Id]), 
    CONSTRAINT [UN_GenFournContact_GenFournId_1] UNIQUE ([GenFournId], [NomContact]), 
    CONSTRAINT [FK_GenFournContact_GenFournId] FOREIGN KEY ([GenFournId]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE, 
);
