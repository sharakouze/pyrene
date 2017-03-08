CREATE TABLE [SA_TMPI].[Edi_ResFacture] (
    [CleFacture]      INT             NOT NULL,
    [CleSI]           INT             NOT NULL,
    [TypReferentiel]  TINYINT         NOT NULL,
    [NumFacture]      VARCHAR (100)   NOT NULL,
    [DatFacture]      SMALLDATETIME   NOT NULL,
    [ClePayeur]       INT             NOT NULL,
    [ClePayeur_Ref]   INT             NULL,
    [CleEmetteur]     INT             NOT NULL,
    [CleDestinataire] INT             NOT NULL,
    [MntHT]           DECIMAL (10, 2) NOT NULL,
    [MntTVA]          DECIMAL (10, 2) NOT NULL,
    [MntTTC]          DECIMAL (10, 2) NOT NULL,
    [NumCodique]      VARCHAR (100)   NULL,
    [NumSiretBudget]  VARCHAR (100)   NULL,
    [CodCollectivite] VARCHAR (100)   NULL,
    [CatTiersPayeur]  VARCHAR (50)    NULL,
    [NatJurPayeur]    VARCHAR (50)    NULL,
    [NomTiersPayeur]  VARCHAR (50)    NULL,
    [PreTiersPayeur]  VARCHAR (50)    NULL,
    [CivTiersPayeur]  VARCHAR (50)    NULL,
    CONSTRAINT [PK_Edi_ResFacture] PRIMARY KEY CLUSTERED ([CleFacture] ASC)
);

