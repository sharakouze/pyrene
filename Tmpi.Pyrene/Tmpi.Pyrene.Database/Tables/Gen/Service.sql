CREATE TABLE [Gen].[Service]
(
    [Id] INT NOT NULL IDENTITY,
    [CodObjet] VARCHAR(100)  NOT NULL,
    [LibObjet] VARCHAR(200) NOT NULL,
    [TxtObjet] VARCHAR(2000) NULL,
    [EstActif] BIT NOT NULL,
    [DatCreation] DATETIME NOT NULL,
    [DatModif] DATETIME NOT NULL,
    [CodExterne] VARCHAR(100) NULL,
    [ServiceParentId] INT NULL,
    [AdrRue] VARCHAR(200) NULL,
    [AdrCode] VARCHAR(10) NULL,
    [AdrCommune] VARCHAR(100) NULL,
    [AdrPays] VARCHAR(100) NULL,
    [NumTelep] VARCHAR(25) NULL,
    [NumFax] VARCHAR(25) NULL,
    [NumEmail] VARCHAR(100) NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY ([Id]),
    CONSTRAINT [UK_Service_CodObjet] UNIQUE ([CodObjet]),
    CONSTRAINT [FK_Service_ServiceParentId] FOREIGN KEY ([ServiceParentId]) REFERENCES [Gen].[Service] ([Id]),
);

GO

CREATE INDEX [IX_Service_ServiceParentId] ON [Gen].[Service] ([ServiceParentId]);

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identifiant unique du service parent.',
    @level0type = N'SCHEMA',
    @level0name = N'Gen',
    @level1type = N'TABLE',
    @level1name = N'Service',
    @level2type = N'COLUMN',
    @level2name = 'ServiceParentId'