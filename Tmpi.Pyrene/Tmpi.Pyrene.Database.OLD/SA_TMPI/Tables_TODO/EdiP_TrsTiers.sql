CREATE TABLE [SA_TMPI].[EdiP_TrsTiers] (
    [CleTiers]       INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [NumTiers]       VARCHAR (50)   NOT NULL,
    [CleTypIdent]    INT            NULL,
    [NomTiers]       VARCHAR (255)  NOT NULL,
    [TxtTiers]       VARCHAR (2000) NULL,
    [AdrRue]         VARCHAR (100)  NULL,
    [AdrCode]        VARCHAR (20)   NULL,
    [AdrVille]       VARCHAR (50)   NULL,
    [AdrEmail]       VARCHAR (100)  NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_TrsTiers_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_TrsTiers_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_TrsTiers] PRIMARY KEY CLUSTERED ([CleTiers] ASC),
    CONSTRAINT [UN_EdiP_TrsTiers] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [NumTiers] ASC, [CleTypIdent] ASC)
);

