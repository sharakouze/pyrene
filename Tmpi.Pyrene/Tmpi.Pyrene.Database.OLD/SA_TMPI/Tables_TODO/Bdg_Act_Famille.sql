CREATE TABLE [SA_TMPI].[Bdg_Act_Famille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [CleFamille_H]  SMALLINT      NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_Act_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_Act_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_Act_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_Bdg_Act_Famille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

