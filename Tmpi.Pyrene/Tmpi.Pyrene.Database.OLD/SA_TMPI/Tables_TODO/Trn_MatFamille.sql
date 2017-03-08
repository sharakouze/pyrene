CREATE TABLE [SA_TMPI].[Trn_MatFamille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trn_MatFamille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trn_MatFamille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    INT           NULL,
    CONSTRAINT [PK_Trn_MatFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_Trn_MatFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

