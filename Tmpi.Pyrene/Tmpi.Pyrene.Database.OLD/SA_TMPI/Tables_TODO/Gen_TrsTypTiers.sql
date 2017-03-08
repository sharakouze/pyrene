CREATE TABLE [SA_TMPI].[Gen_TrsTypTiers] (
    [CleTypTiers]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodTypTiers]   VARCHAR (50)  NOT NULL,
    [LibTypTiers]   VARCHAR (100) NOT NULL,
    [TxtTypTiers]   VARCHAR (255) NULL,
    [TypTiers_TMPI] SMALLINT      NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_TrsTypTiers_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_TrsTypTiers_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Gen_TrsTypTiers_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    TINYINT       NULL,
    CONSTRAINT [PK_Gen_TrsTypTiers] PRIMARY KEY CLUSTERED ([CleTypTiers] ASC),
    CONSTRAINT [UN_Gen_TrsTypTiers] UNIQUE NONCLUSTERED ([CodTypTiers] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsTypTiers]
    ON [SA_TMPI].[Gen_TrsTypTiers]([CodTypTiers] ASC);

