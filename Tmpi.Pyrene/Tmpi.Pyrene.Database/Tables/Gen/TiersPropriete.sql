CREATE TABLE [Gen].[TiersPropriete]
(
    [Id] INT NOT NULL IDENTITY,
    [TiersId] INT NOT NULL,
	[ProprieteTiersId] INT NOT NULL,
    CONSTRAINT [PK_TiersPropriete] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_TiersPropriete_TiersId_ProprieteTiersId] UNIQUE ([TiersId], [ProprieteTiersId]),
    CONSTRAINT [FK_TiersPropriete_TiersId] FOREIGN KEY ([TiersId]) REFERENCES [Gen].[Tiers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TiersPropriete_ProprieteTiersId] FOREIGN KEY ([ProprieteTiersId]) REFERENCES [Gen].[ProprieteTiers] ([Id])
);
