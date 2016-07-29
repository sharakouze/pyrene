CREATE TABLE [Equ].[Equip]
(
    [CleEquip] INT NOT NULL IDENTITY, 
    [CodEquip] VARCHAR(100) NOT NULL, 
    [LibEquip] VARCHAR(200) NOT NULL, 
    [TxtEquip] VARCHAR(500) NULL, 
    [EstActif] BIT NOT NULL, 
    [DatCreation] DATETIME NOT NULL, 
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    CONSTRAINT [PK_Equip] PRIMARY KEY ([CleEquip]), 
    CONSTRAINT [UN_Equip_CodEquip] UNIQUE ([CodEquip])
);

GO

CREATE INDEX [IX_Equip_LibEquip] ON [Equ].[Equip] ([LibEquip]);
