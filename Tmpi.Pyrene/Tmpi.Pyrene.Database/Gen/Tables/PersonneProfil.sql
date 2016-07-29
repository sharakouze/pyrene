CREATE TABLE [Gen].[PersonneProfil]
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
    CONSTRAINT [FK_PersonneProfil_ClePersonne] FOREIGN KEY ([ClePersonne]) REFERENCES [Gen].[Personne] ([ClePersonne]) ON DELETE CASCADE,
    CONSTRAINT [FK_PersonneProfil_CleSociete] FOREIGN KEY ([CleSociete]) REFERENCES [Gen].[Societe] ([CleSociete]),
    CONSTRAINT [FK_PersonneProfil_CleSecteur] FOREIGN KEY ([CleSecteur]) REFERENCES [Gen].[SocieteSecteur] ([CleSecteur]),
    CONSTRAINT [FK_PersonneProfil_CleService] FOREIGN KEY ([CleService]) REFERENCES [Gen].[SocieteService] ([CleService]),
);
