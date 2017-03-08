CREATE TABLE [SA_TMPI].[Trp_Dem_Origine] (
    [CleOrigine]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleOrigine_C]  SMALLINT      NULL,
    [CleOrigine_H]  SMALLINT      NOT NULL,
    [CodOrigine]    VARCHAR (50)  NOT NULL,
    [LibOrigine]    VARCHAR (100) NOT NULL,
    [TxtOrigine]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Dem_Origine_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Dem_Origine_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigin]     SMALLINT      NULL,
    CONSTRAINT [PK_Trp_DemOrigine] PRIMARY KEY CLUSTERED ([CleOrigine] ASC),
    CONSTRAINT [UN_Trp_DemOrigine] UNIQUE NONCLUSTERED ([CodOrigine] ASC)
);

