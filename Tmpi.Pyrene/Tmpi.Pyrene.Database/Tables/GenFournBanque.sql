CREATE TABLE [GenFournBanque]
(
    [CleBanque] INT NOT NULL IDENTITY,
    [CleFourn] INT NOT NULL,
    [LibBanque] VARCHAR(200) NOT NULL,
    [RibBanque] VARCHAR(5) NOT NULL,
    [RibGuichet] VARCHAR(5) NOT NULL,
    [RibCompte] VARCHAR(11) NOT NULL,
    [RibCle] VARCHAR(2) NOT NULL,
    [EstDefaut] BIT NOT NULL,
    CONSTRAINT [PK_GenFournBanque] PRIMARY KEY ([CleBanque]),
    CONSTRAINT [FK_GenFournBanque_CleFourn] FOREIGN KEY ([CleFourn]) REFERENCES [GenFourn] ([CleFourn]) ON DELETE CASCADE
);
