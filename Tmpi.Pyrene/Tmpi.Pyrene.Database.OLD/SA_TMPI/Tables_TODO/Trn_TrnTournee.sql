CREATE TABLE [SA_TMPI].[Trn_TrnTournee] (
    [CleTournee]       INT            IDENTITY (1, 1) NOT NULL,
    [TxtTournee]       VARCHAR (1000) NULL,
    [ClePreleveur]     SMALLINT       NULL,
    [NivTraitement]    TINYINT        CONSTRAINT [DF_Trn_TrnTournee_NivTraitement] DEFAULT ((1)) NOT NULL,
    [DatCreation]      SMALLDATETIME  CONSTRAINT [DF_Trn_TrnTournee_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]      SMALLINT       CONSTRAINT [DF_Trn_TrnTournee_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]         SMALLDATETIME  NULL,
    [CleOperateur]     SMALLINT       NULL,
    [DatValidation]    SMALLDATETIME  NULL,
    [CleValideur]      SMALLINT       NULL,
    [DatTournee]       SMALLDATETIME  NULL,
    [DatRealisation]   DATETIME       NULL,
    [CleMTournee]      SMALLINT       NULL,
    [EstActif]         BIT            CONSTRAINT [DF_Trn_TrnTournee_EstActif] DEFAULT ((1)) NULL,
    [CleExterne]       INT            NULL,
    [CleOrigine]       INT            NULL,
    [CleSecteur]       SMALLINT       NOT NULL,
    [NbrKilometre]     SMALLINT       NULL,
    [DurTournee]       SMALLINT       NULL,
    [PrxUnitaire_K]    DECIMAL (5, 2) NULL,
    [PrxUnitaire_H]    DECIMAL (5, 2) NULL,
    [PrxUnitaire_T]    DECIMAL (5, 2) NULL,
    [NbrTache]         INT            NULL,
    [DatActualisation] SMALLDATETIME  NULL,
    [NumTournee]       AS             (CONVERT([varchar](50),[CleTournee],0)) PERSISTED,
    [EstVerrouille]    BIT            CONSTRAINT [DF_Trn_TrnTourneeEstVerrouille] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Trn_TrnTournee] PRIMARY KEY CLUSTERED ([CleTournee] ASC),
    CONSTRAINT [FK1_Trn_TrnTournee] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Trn_TrnTournee] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur])
);


GO
CREATE NONCLUSTERED INDEX [ID09_Trn_TrnTournee]
    ON [SA_TMPI].[Trn_TrnTournee]([DatTournee] ASC);

