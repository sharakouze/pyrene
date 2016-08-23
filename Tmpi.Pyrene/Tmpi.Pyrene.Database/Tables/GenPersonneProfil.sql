CREATE TABLE [GenPersonneProfil]
(
    [CleProfil] INT NOT NULL IDENTITY,
    [ClePersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    CONSTRAINT [PK_GenPersonneProfil] PRIMARY KEY ([CleProfil]), 
    CONSTRAINT [UN_GenPersonneProfil_CodProfil_1] UNIQUE ([CodProfil], [ClePersonne]), 
    CONSTRAINT [UN_GenPersonneProfil_ClePersonne_1] UNIQUE ([ClePersonne], [CleSociete], [CleSecteur], [CleService]),
    CONSTRAINT [FK_GenPersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GenPersonne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenPersonneProfil_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GenSociete] ([CleSociete]),
    CONSTRAINT [FK_GenPersonneProfil_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GenSocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_GenPersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [GenSocieteService] ([CleService]),
);
