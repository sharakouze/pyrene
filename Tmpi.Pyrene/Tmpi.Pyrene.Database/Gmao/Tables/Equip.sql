CREATE TABLE [Gmao].[Equip]
(
	[CleEquip] INT NOT NULL IDENTITY, 
    [CodEquip] VARCHAR(100) NOT NULL, 
    [LibEquip] VARCHAR(200) NOT NULL, 
    [TxtEquip] VARCHAR(500) NULL, 
    [EstActif] BIT NOT NULL, 
    CONSTRAINT [PK_Equip] PRIMARY KEY ([CleEquip])
)
