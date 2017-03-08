CREATE TABLE [SA_TMPI].[Trp_Dem_CodeBarre] (
    [CleCodeBarre]              SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleCodeBarre_C]            SMALLINT      NULL,
    [CleCodeBarre_H]            SMALLINT      NOT NULL,
    [CodCodeBarre]              VARCHAR (50)  NOT NULL,
    [LibCodeBarre]              VARCHAR (100) NOT NULL,
    [NbrCarTotal]               TINYINT       NOT NULL,
    [NbrCarTotalEstIdentifiant] BIT           NOT NULL,
    [TxtCodeBarre]              VARCHAR (255) NULL,
    [EstActif]                  BIT           CONSTRAINT [DF_Trp_Dem_CodeBarre_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]               SMALLDATETIME CONSTRAINT [DF_Trp_Dem_CodeBarre_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]               SMALLINT      NOT NULL,
    [DatModif]                  SMALLDATETIME NULL,
    [CleOperateur]              SMALLINT      NULL,
    [DatValidation]             SMALLDATETIME NULL,
    [CleValideur]               SMALLINT      NULL,
    [CleExterne]                INT           NULL,
    [CleOrigine]                SMALLINT      NULL,
    CONSTRAINT [PK_Trp_Dem_CodeBarre] PRIMARY KEY CLUSTERED ([CleCodeBarre] ASC),
    CONSTRAINT [UN_Trp_Dem_CodeBarre] UNIQUE NONCLUSTERED ([CodCodeBarre] ASC)
);

