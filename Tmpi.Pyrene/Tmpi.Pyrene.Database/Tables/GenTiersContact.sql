CREATE TABLE [GenTiersContact]
(
    [CleContact] INT NOT NULL IDENTITY,
    [CleTiers] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtContact] VARCHAR(500) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_GenTiersContact] PRIMARY KEY ([CleContact]), 
    CONSTRAINT [UN_GenTiersContact_CleTiers_1] UNIQUE ([CleTiers], [NomContact]), 
    CONSTRAINT [FK_GenTiersContact_CleTiers] FOREIGN KEY ([CleTiers]) REFERENCES [GenTiers] ([CleTiers]) ON DELETE CASCADE, 
);

GO

CREATE INDEX [IX_GenTiersContact_CleTiers] ON [GenTiersContact] ([CleTiers]);
