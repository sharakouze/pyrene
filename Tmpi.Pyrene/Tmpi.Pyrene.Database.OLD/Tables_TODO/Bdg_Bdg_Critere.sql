CREATE TABLE [SA_TMPI].[Bdg_Bdg_Critere] (
    [CleCritere]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleCritere_C]  SMALLINT      NULL,
    [CleCritere_H]  SMALLINT      NOT NULL,
    [CodCritere]    VARCHAR (50)  NOT NULL,
    [LibCritere]    VARCHAR (100) NOT NULL,
    [TxtCritere]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_Bdg_Critere_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_Bdg_Critere_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleFamille]    SMALLINT      NOT NULL,
    CONSTRAINT [PK_Bdg_Bdg_Critere] PRIMARY KEY CLUSTERED ([CleCritere] ASC),
    CONSTRAINT [FK1_Bdg_Bdg_Critere] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Bdg_CrtFamille] ([CleFamille]),
    CONSTRAINT [UN_Bdg_Bdg_Critere] UNIQUE NONCLUSTERED ([CleFamille] ASC, [CodCritere] ASC)
);

