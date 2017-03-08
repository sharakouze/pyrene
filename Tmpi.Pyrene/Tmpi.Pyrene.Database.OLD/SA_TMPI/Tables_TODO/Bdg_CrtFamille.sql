CREATE TABLE [SA_TMPI].[Bdg_CrtFamille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [CleFamille_H]  SMALLINT      NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_CrtFamille_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_CrtFamille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_CrtFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_Bdg_CrtFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

