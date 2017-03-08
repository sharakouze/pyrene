CREATE TABLE [SA_TMPI].[LmsP_Com_Famille] (
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    [CleFamille]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT       NULL,
    [CleFamille_H]  SMALLINT       NOT NULL,
    [CodFamille]    VARCHAR (50)   NOT NULL,
    [LibFamille]    VARCHAR (400)  NOT NULL,
    [TxtFamille]    VARCHAR (1000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_LmsP_Com_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_LmsP_Com_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_LmsP_Com_Famille_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_LmsP_Com_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_LmsP_Com_Famille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

