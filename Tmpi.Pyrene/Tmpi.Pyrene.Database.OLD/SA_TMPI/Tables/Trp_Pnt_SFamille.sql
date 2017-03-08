CREATE TABLE [SA_TMPI].[Trp_Pnt_SFamille] (
    [CleFamille]    SMALLINT      NOT NULL,
    [CleSFamille]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleSFamille_C] SMALLINT      NULL,
    [CleSFamille_H] SMALLINT      NOT NULL,
    [CodSFamille]   VARCHAR (50)  NOT NULL,
    [LibSFamille]   VARCHAR (100) NOT NULL,
    [TxtSFamille]   VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Pnt_SFamille_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Pnt_SFamille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Trn_Pnt_SFamille] PRIMARY KEY CLUSTERED ([CleSFamille] ASC),
    CONSTRAINT [FK_Trn_Pnt_SFamille] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Trp_Pnt_Famille] ([CleFamille])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_Pnt_SFamille]
    ON [SA_TMPI].[Trp_Pnt_SFamille]([CleFamille] ASC);

