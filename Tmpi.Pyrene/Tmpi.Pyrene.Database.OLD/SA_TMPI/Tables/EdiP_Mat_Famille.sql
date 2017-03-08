CREATE TABLE [SA_TMPI].[EdiP_Mat_Famille] (
    [CleFamille]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodFamille]     VARCHAR (50)   NOT NULL,
    [LibFamille]     VARCHAR (255)  NOT NULL,
    [TxtFamille]     VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_Mat_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_Mat_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_Mat_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_EdiP_Mat_Famille] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodFamille] ASC)
);

