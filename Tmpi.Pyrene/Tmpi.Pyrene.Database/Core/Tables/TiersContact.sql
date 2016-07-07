CREATE TABLE [Core].[TiersContact]
(
	[CleContact] INT NOT NULL IDENTITY,
	[CleTiers] INT NOT NULL,
	[NomContact] VARCHAR(200) NOT NULL,
	[TxtContact] VARCHAR(500) NOT NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [TypGenre] TINYINT NULL,
    [CodFonction] VARCHAR(100) NULL,
    CONSTRAINT [PK_TiersContact] PRIMARY KEY ([CleContact]), 
    CONSTRAINT [FK_TiersContact_CleTiers] FOREIGN KEY ([CleTiers]) REFERENCES [Core].[Tiers]([CleTiers]), 
);

GO

CREATE INDEX [IX_TiersContact_CleTiers] ON [Core].[TiersContact] ([CleTiers]);
