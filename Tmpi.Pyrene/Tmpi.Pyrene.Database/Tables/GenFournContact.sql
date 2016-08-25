CREATE TABLE [GenFournContact]
(
    [CleContact] INT NOT NULL IDENTITY,
    [CleFourn] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtContact] VARCHAR(500) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenFournContact] PRIMARY KEY ([CleContact]), 
    CONSTRAINT [UN_GenFournContact_CleFourn_1] UNIQUE ([CleFourn], [NomContact]), 
    CONSTRAINT [FK_GenFournContact_CleFourn] FOREIGN KEY ([CleFourn]) REFERENCES [GenFourn] ([CleFourn]) ON DELETE CASCADE, 
);
