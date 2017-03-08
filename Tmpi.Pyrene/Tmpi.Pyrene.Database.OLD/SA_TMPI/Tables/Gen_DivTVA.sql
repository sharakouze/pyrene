CREATE TABLE [SA_TMPI].[Gen_DivTVA] (
    [CleTVA]        SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleTVA_C]      SMALLINT       NULL,
    [CleTVA_H]      SMALLINT       NOT NULL,
    [CodTVA]        VARCHAR (50)   NOT NULL,
    [LibTVA]        VARCHAR (100)  NOT NULL,
    [TxtTVA]        VARCHAR (255)  NULL,
    [TauTVA]        DECIMAL (5, 2) NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Gen_DivTVA_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Gen_DivTVA_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Gen_DivTVA_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    TINYINT        NULL,
    [NumCompte]     VARCHAR (25)   NULL,
    CONSTRAINT [PK_Gen_DivTVA] PRIMARY KEY CLUSTERED ([CleTVA] ASC),
    CONSTRAINT [UN1_Gen_DivTVA] UNIQUE NONCLUSTERED ([CodTVA] ASC, [CleTVA_H] ASC)
);

