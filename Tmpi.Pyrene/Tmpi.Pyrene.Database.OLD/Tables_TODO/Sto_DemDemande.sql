CREATE TABLE [SA_TMPI].[Sto_DemDemande] (
    [CleMagasin]       TINYINT         NOT NULL,
    [CleMagasinClient] TINYINT         NULL,
    [CleSecteur]       SMALLINT        NULL,
    [CleService]       SMALLINT        NOT NULL,
    [CleDemandeur]     SMALLINT        NULL,
    [NomDemandeur]     VARCHAR (100)   NOT NULL,
    [CleDemande]       INT             IDENTITY (1, 1) NOT NULL,
    [NumDemande]       VARCHAR (25)    NULL,
    [TypDemande]       TINYINT         CONSTRAINT [DF_Sto_DemDemande_TypDemande] DEFAULT ((1)) NOT NULL,
    [DatDemande]       SMALLDATETIME   CONSTRAINT [DF_Sto_DemDemande_DatDemande] DEFAULT (getdate()) NOT NULL,
    [TxtDemande]       VARCHAR (4000)  NULL,
    [EstUnTransfert]   BIT             CONSTRAINT [DF_Sto_DemDemande_EstUnTransfert] DEFAULT ((0)) NOT NULL,
    [CleAffectation]   SMALLINT        NULL,
    [MntHT]            DECIMAL (10, 2) CONSTRAINT [DF_Sto_DemDemande_MntHT] DEFAULT ((0)) NOT NULL,
    [MntTva]           DECIMAL (10, 2) CONSTRAINT [DF_Sto_DemDemande_MntTva] DEFAULT ((0)) NOT NULL,
    [EstSolde]         BIT             CONSTRAINT [DF_Sto_DemDemande_EstSolde] DEFAULT ((0)) NOT NULL,
    [NivTraitement]    TINYINT         CONSTRAINT [DF_Sto_DemDemande_NivTraitement] DEFAULT ((0)) NOT NULL,
    [DatCreation]      SMALLDATETIME   CONSTRAINT [DF_Sto_DemDemande_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]      SMALLINT        CONSTRAINT [DF_Sto_DemDemande_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModification]  SMALLDATETIME   NULL,
    [CleModificateur]  SMALLINT        NULL,
    [DatValidation]    SMALLDATETIME   NULL,
    [CleClient]        SMALLINT        NOT NULL,
    [CleValideur]      SMALLINT        NULL,
    [CleExercice]      TINYINT         NULL,
    [CleDevise_Old]    TINYINT         NULL,
    [EstALivrer]       BIT             CONSTRAINT [DF_Sto_DemDemande_EstALivrer] DEFAULT ((0)) NOT NULL,
    [EstPrepare]       BIT             CONSTRAINT [DF_Sto_DemDemande_EstPrepare] DEFAULT ((0)) NOT NULL,
    [ValCritere]       VARCHAR (100)   NULL,
    [EstHorsStock]     BIT             CONSTRAINT [DF_Sto_DemDemande_EstHorsStock] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sto_DemDemande] PRIMARY KEY CLUSTERED ([CleDemande] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_DemDemande]
    ON [SA_TMPI].[Sto_DemDemande]([NumDemande] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Sto_DemDemande]
    ON [SA_TMPI].[Sto_DemDemande]([CleMagasin] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Sto_DemDemande]
    ON [SA_TMPI].[Sto_DemDemande]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Sto_DemDemande]
    ON [SA_TMPI].[Sto_DemDemande]([CleService] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Sto_DemDemande]
    ON [SA_TMPI].[Sto_DemDemande]([NivTraitement] ASC);

