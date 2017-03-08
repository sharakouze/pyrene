CREATE TABLE [SA_TMPI].[Gen_TrsTiers] (
    [CleTiers]      INT              IDENTITY (1, 1) NOT NULL,
    [CleTiers_C]    INT              NULL,
    [CleTiers_H]    INT              NOT NULL,
    [NumTiers]      VARCHAR (50)     NOT NULL,
    [CleTypIdent]   SMALLINT         CONSTRAINT [DF_Gen_TrsTiers_CleTypIdent] DEFAULT ((0)) NOT NULL,
    [CodCompta]     VARCHAR (50)     NULL,
    [NomTiers]      VARCHAR (100)    NOT NULL,
    [TxtTiers]      VARCHAR (2000)   NULL,
    [AdrRue]        VARCHAR (100)    NULL,
    [AdrCode]       VARCHAR (10)     NULL,
    [AdrVille]      VARCHAR (50)     NULL,
    [NumInsee]      VARCHAR (25)     NULL,
    [ClePays]       TINYINT          NULL,
    [NumTelep]      VARCHAR (25)     NULL,
    [NumTelec]      VARCHAR (25)     NULL,
    [NumEMail]      VARCHAR (50)     NULL,
    [NomContact]    VARCHAR (50)     NULL,
    [EstActif]      BIT              CONSTRAINT [DF_Gen_TrsTiers_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME    CONSTRAINT [DF_Gen_TrsTiers_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT         CONSTRAINT [DF_Gen_TrsTiers_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME    NULL,
    [CleOperateur]  SMALLINT         NULL,
    [DatValidation] SMALLDATETIME    NULL,
    [CleValideur]   SMALLINT         NULL,
    [CleExterne]    INT              NULL,
    [CleOrigine]    TINYINT          NULL,
    [AdrLatitude]   DECIMAL (20, 13) NULL,
    [AdrLongitude]  DECIMAL (20, 13) NULL,
    [AdrVilleSuite] VARCHAR (50)     NULL,
    [CleCivilite]   SMALLINT         NULL,
    [CleLangue]     SMALLINT         NULL,
    [ClePointP]     INT              NULL,
    [ClePropriete1] SMALLINT         NULL,
    [ClePropriete2] SMALLINT         NULL,
    [ClePropriete3] SMALLINT         NULL,
    CONSTRAINT [PK_Gen_TrsTiers] PRIMARY KEY CLUSTERED ([CleTiers] ASC),
    CONSTRAINT [UN_Gen_TrsTiers] UNIQUE NONCLUSTERED ([CleTiers_H] ASC, [NumTiers] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsTiers]
    ON [SA_TMPI].[Gen_TrsTiers]([NumTiers] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Gen_TrsTiers]
    ON [SA_TMPI].[Gen_TrsTiers]([NomTiers] ASC);

