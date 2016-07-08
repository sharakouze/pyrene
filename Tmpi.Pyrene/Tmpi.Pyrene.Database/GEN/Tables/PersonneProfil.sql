CREATE TABLE [GEN].[PersonneProfil]
(
    [CleProfil] INT NOT NULL IDENTITY,
    [ClePersonne] INT NOT NULL,
    [CodProfil] VARCHAR(100) NOT NULL,
    [CleSociete] INT NULL,
    [CleSecteur] INT NULL,
    [CleService] INT NULL,
    CONSTRAINT [PK_PersonneProfil] PRIMARY KEY ([CleProfil]), 
    CONSTRAINT [UN_PersonneProfil_CodProfil] UNIQUE ([CodProfil], [ClePersonne]), 
    CONSTRAINT [UN_PersonneProfil_ClePersonne] UNIQUE ([ClePersonne], [CleSociete], [CleSecteur], [CleService]),
    CONSTRAINT [FK_PersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [GEN].[Personne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_PersonneProfil_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [GEN].[Societe] ([CleSociete]),
    CONSTRAINT [FK_PersonneProfil_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [GEN].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_PersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [GEN].[SocieteService] ([CleService]),
);
