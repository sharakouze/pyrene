CREATE TABLE [SA_TMPI].[EdiP_Par_Valeur] (
    [CleValeur]      INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodValeur]      VARCHAR (50)   NOT NULL,
    [LibValeur]      VARCHAR (255)  NOT NULL,
    [TxtValeur]      VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_Par_Valeur_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_Par_Valeur_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    [ValValeur]      VARCHAR (50)   NULL,
    CONSTRAINT [PK_EdiP_Par_Valeur] PRIMARY KEY CLUSTERED ([CleValeur] ASC),
    CONSTRAINT [UN_EdiP_Par_Valeur] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodValeur] ASC, [LibValeur] ASC)
);

