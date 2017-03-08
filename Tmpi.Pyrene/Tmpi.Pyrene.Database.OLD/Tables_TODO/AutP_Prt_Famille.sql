CREATE TABLE [SA_TMPI].[AutP_Prt_Famille] (
    [CleFamille]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleFamille_C]   SMALLINT       NULL,
    [CleFamille_H]   SMALLINT       NOT NULL,
    [CodFamille]     VARCHAR (100)  NOT NULL,
    [LibFamille]     VARCHAR (200)  NOT NULL,
    [TxtFamille]     VARCHAR (1000) NULL,
    [NbrLigne]       TINYINT        NOT NULL,
    [NbrColonne]     TINYINT        NOT NULL,
    [NbrEchantillon] TINYINT        NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_AutP_Prt_Famille_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_AutP_Prt_Famille_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       CONSTRAINT [DF_AutP_Prt_Famille_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    [DatValidation]  SMALLDATETIME  NULL,
    [CleValideur]    SMALLINT       NULL,
    CONSTRAINT [PK_AutP_Prt_Famille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN_AutP_Prt_Famille] UNIQUE NONCLUSTERED ([CleFamille_H] ASC, [CodFamille] ASC)
);

