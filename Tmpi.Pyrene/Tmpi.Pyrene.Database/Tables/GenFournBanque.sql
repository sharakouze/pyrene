CREATE TABLE [GenFournBanque]
(
    [Id] INT NOT NULL IDENTITY,
    [CleGenFourn] INT NOT NULL,
    [NumRib] VARCHAR(23) NOT NULL,
    [LibEtablissement] VARCHAR(200) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_GenFournBanque_CleGenFourn_RibBanque] UNIQUE ([CleGenFourn], [NumRib]), 
    CONSTRAINT [FK_GenFournBanque_CleGenFourn] FOREIGN KEY ([CleGenFourn]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE
);
