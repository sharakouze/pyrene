CREATE TABLE [SA_TMPI].[TrnP_Rsc_Famille] (
    [CleFamille]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT       NULL,
    [CleFamille_H]  SMALLINT       NOT NULL,
    [CodFamille]    VARCHAR (100)  NOT NULL,
    [LibFamille]    VARCHAR (200)  NOT NULL,
    [TxtFamille]    VARCHAR (2000) NULL,
    [TypRessource]  TINYINT        NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_TrnP_Rsc_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_TrnP_Rsc_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_TrnP_Rsc_Famille_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_TrnP_Rsc_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_TrnP_Rsc_Famille] UNIQUE NONCLUSTERED ([CodFamille] ASC, [TypRessource] ASC)
);

