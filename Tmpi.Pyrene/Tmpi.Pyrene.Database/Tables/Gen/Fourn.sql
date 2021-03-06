﻿CREATE TABLE [Gen].[Fourn]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100) NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    [CodCompta] VARCHAR(100) NULL,
    [NumClient] VARCHAR(100) NULL,
    [NumTVAIntra] VARCHAR(25) NULL,
    [MntFPort] DECIMAL(15,2) NULL,
    [MntFPortGratuit] DECIMAL(15,2) NULL,
    [MntCommandeMin] DECIMAL(15,2) NULL,
    [DelLivraison] TINYINT NULL,
    [DelPaiement] TINYINT NULL,
    [ValNote] DECIMAL(5,2) NULL,
    [TypModeReglement] INT NULL,
    [EstEnvoiMailBonCde] BIT NOT NULL,
    CONSTRAINT [PK_Fourn] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_Fourn_CodObjet] UNIQUE ([CodObjet]), 
);

GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Code comptabilité.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'CodCompta'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numéro de client.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'NumClient'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numéro de TVA intracommunautaire.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'NumTVAIntra'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Frais de port.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'MntFPort'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Montant minimum pour frais de port gratuits.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'MntFPortGratuit'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Montant minimum à commander.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'MntCommandeMin'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Délais de livraison en jours.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'DelLivraison'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Délais de paiement en jours.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'DelPaiement'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Note globale.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'ValNote'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Mode de règlement.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Fourn',
    @level2type = N'COLUMN',
    @level2name = N'TypModeReglement'
GO
