CREATE TABLE [SA_TMPI].[Gen_Soc_Qualif] (
    [CleQualif]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleQualif_C]   SMALLINT      NULL,
    [CleQualif_H]   SMALLINT      NOT NULL,
    [CodQualif]     VARCHAR (50)  NOT NULL,
    [LibQualif]     VARCHAR (100) NOT NULL,
    [TxtQualif]     VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_Soc_Qualif_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_Soc_Qualif_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    TINYINT       NULL,
    CONSTRAINT [PK_Gen_Soc_Qualif] PRIMARY KEY CLUSTERED ([CleQualif] ASC),
    CONSTRAINT [UN_Gen_Soc_Qualif] UNIQUE NONCLUSTERED ([CleQualif_H] ASC, [CodQualif] ASC)
);

