CREATE TABLE [SA_TMPI].[Trp_Dem_Famille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [CleFamille_H]  SMALLINT      NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Dem_Famille_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Dem_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    [CleMNumero]    SMALLINT      NOT NULL,
    CONSTRAINT [PK_Trp_DemFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [FK1_Trp_Dem_Famille] FOREIGN KEY ([CleMNumero]) REFERENCES [SA_TMPI].[Gen_Cpt_MNumero] ([CleMNumero]),
    CONSTRAINT [UN_Trp_DemFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

