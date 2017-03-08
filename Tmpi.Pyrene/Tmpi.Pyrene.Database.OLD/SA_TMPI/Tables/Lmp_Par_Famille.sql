CREATE TABLE [SA_TMPI].[Lmp_Par_Famille] (
    [CleFamille]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT       NULL,
    [CleFamille_H]  SMALLINT       NOT NULL,
    [CodFamille]    VARCHAR (50)   NOT NULL,
    [LibFamille]    VARCHAR (500)  NOT NULL,
    [TxtFamille]    VARCHAR (1000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_Par_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_Par_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Lmp_Par_Famille_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    [CleOrigine]    TINYINT        NULL,
    [CleExterne]    INT            NULL,
    CONSTRAINT [PK_Lmp_Par_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_Lmp_Par_Famille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

