CREATE TABLE [Gen].[ProprieteTiers]
(
    [CleProprieteTiers] INT NOT NULL IDENTITY,
    [CodProprieteTiers] VARCHAR(100) NOT NULL,
    [LibProprieteTiers] VARCHAR(200) NOT NULL,
    [TxtProprieteTiers] VARCHAR (2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NULL,
    [CodExterne] VARCHAR(100) NULL,
    CONSTRAINT [PK_ProprieteTiers] PRIMARY KEY ([CleProprieteTiers]),
    CONSTRAINT [UK_ProprieteTiers_CodProprieteTiers] UNIQUE ([CodProprieteTiers])
);
