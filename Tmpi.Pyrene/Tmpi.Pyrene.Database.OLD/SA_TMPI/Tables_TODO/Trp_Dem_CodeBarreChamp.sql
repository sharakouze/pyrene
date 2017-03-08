CREATE TABLE [SA_TMPI].[Trp_Dem_CodeBarreChamp] (
    [CleChamp]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleChamp_C]    SMALLINT      NULL,
    [CleChamp_H]    SMALLINT      NOT NULL,
    [CodChamp]      VARCHAR (50)  NOT NULL,
    [LibChamp]      VARCHAR (100) NOT NULL,
    [TxtChamp]      VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Dem_CodeBarreChamp_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Dem_CodeBarreChamp_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Trp_Dem_CodeBarreChamp] PRIMARY KEY CLUSTERED ([CleChamp] ASC),
    CONSTRAINT [UN_Trp_Dem_CodeBarreChamp] UNIQUE NONCLUSTERED ([CodChamp] ASC)
);

