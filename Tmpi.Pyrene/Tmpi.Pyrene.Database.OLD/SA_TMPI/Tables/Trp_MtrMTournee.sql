CREATE TABLE [SA_TMPI].[Trp_MtrMTournee] (
    [CleMTournee]   INT            IDENTITY (1, 1) NOT NULL,
    [CodMTournee]   NVARCHAR (50)  NOT NULL,
    [LibMTournee]   NVARCHAR (100) NOT NULL,
    [TxtMTournee]   NVARCHAR (255) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Trp_MtrMTournee_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Trp_MtrMTournee_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   INT            NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    [CleSecteur]    SMALLINT       NULL,
    [DurTournee]    SMALLINT       NULL,
    CONSTRAINT [PK1_Trn_MtrPoint] PRIMARY KEY CLUSTERED ([CleMTournee] ASC)
);

