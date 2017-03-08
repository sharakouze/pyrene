CREATE TABLE [SA_TMPI].[EdiP_ComValeur] (
    [CleValeur]      INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodValeur]      VARCHAR (50)   NOT NULL,
    [LibValeur]      VARCHAR (255)  NOT NULL,
    [TxtValeur]      VARCHAR (2000) NULL,
    [EstActif]       BIT            NOT NULL,
    [CleCommemo]     INT            NOT NULL,
    [DatCreation]    SMALLDATETIME  NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_Com_Valeur] PRIMARY KEY CLUSTERED ([CleValeur] ASC),
    CONSTRAINT [UN_EdiP_Com_Valeur] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodValeur] ASC, [CleCommemo] ASC)
);

