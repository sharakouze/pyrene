CREATE TABLE [Trs].[TiersContact]
(
    [CleContact] INT NOT NULL IDENTITY,
    [CleTiers] INT NOT NULL,
    [NomContact] VARCHAR(100) NOT NULL,
    [PreContact] VARCHAR(100) NULL,
    [TxtContact] VARCHAR(500) NOT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_TiersContact] PRIMARY KEY ([CleContact]), 
    CONSTRAINT [UN_TiersContact_CleTiers] UNIQUE ([CleTiers], [NomContact]), 
    CONSTRAINT [FK_TiersContact_CleTiers] FOREIGN KEY ([CleTiers]) REFERENCES [Trs].[Tiers]([CleTiers]), 
);

GO

CREATE INDEX [IX_TiersContact_CleTiers] ON [Trs].[TiersContact] ([CleTiers]);
