CREATE TABLE [GenFournContact]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenFourn] INT NOT NULL,
    [LibObjet] VARCHAR(100) NOT NULL,
    [TxtObjet] VARCHAR(500) NULL,
    [PreContact] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] INT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenFournContact] PRIMARY KEY ([Id]), 
    CONSTRAINT [UK_GenFournContact_CleGenFourn_NomContact] UNIQUE ([CleGenFourn], [LibObjet]), 
    CONSTRAINT [FK_GenFournContact_CleGenFourn] FOREIGN KEY ([CleGenFourn]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE, 
);
