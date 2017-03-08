CREATE TABLE [SA_TMPI].[Trp_Pnt_Famille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [CleFamille_H]  SMALLINT      NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Pnt_Famille_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Pnt_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Trn_Pnt_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_Trn_Pnt_Famille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

