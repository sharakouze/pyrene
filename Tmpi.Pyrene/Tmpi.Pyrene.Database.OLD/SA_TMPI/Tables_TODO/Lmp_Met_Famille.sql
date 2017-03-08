CREATE TABLE [SA_TMPI].[Lmp_Met_Famille] (
    [CleFamille]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]  SMALLINT       NULL,
    [CleFamille_H]  SMALLINT       NOT NULL,
    [CodFamille]    VARCHAR (100)  NOT NULL,
    [LibFamille]    VARCHAR (200)  NOT NULL,
    [TxtFamille]    VARCHAR (1000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_Met_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_Met_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Lmp_Met_Famille_CleCreateur] DEFAULT ((1)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    CONSTRAINT [PK_Lmp_Met_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [FK1_Lmp_Met_Famille] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_Met_Famille] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Lmp_Met_Famille] UNIQUE NONCLUSTERED ([CleFamille_H] ASC, [CodFamille] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID_Lmp_Met_Famille]
    ON [SA_TMPI].[Lmp_Met_Famille]([CodFamille] ASC);

