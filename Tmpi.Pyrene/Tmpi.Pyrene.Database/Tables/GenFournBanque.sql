CREATE TABLE [GenFournBanque]
(
    [Id] INT NOT NULL IDENTITY,
    [GenFournId] INT NOT NULL,
    [LibBanque] VARCHAR(200) NOT NULL,
    [RibBanque] VARCHAR(5) NOT NULL,
    [RibGuichet] VARCHAR(5) NOT NULL,
    [RibCompte] VARCHAR(11) NOT NULL,
    [RibCle] VARCHAR(2) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GenFournBanque_GenFournId] FOREIGN KEY ([GenFournId]) REFERENCES [GenFourn] ([Id]) ON DELETE CASCADE
);
