CREATE TABLE [SA_TMPI].[Sto9_FouMarche] (
    [CleFournisseur] INT             NULL,
    [CleMarche]      INT             NOT NULL,
    [CodMarche]      VARCHAR (50)    NOT NULL,
    [LibMarche]      VARCHAR (100)   NOT NULL,
    [TxtMarche]      VARCHAR (255)   NULL,
    [DatOuverture]   SMALLDATETIME   NULL,
    [DatCloture]     SMALLDATETIME   NULL,
    [MntMini]        DECIMAL (15, 2) NOT NULL,
    [MntMaxi]        DECIMAL (15, 2) NOT NULL,
    [MntAlerte]      DECIMAL (15, 2) NULL,
    [CleEngagement]  INT             NULL,
    [DatValidation]  SMALLDATETIME   NULL,
    [CleValideur]    SMALLINT        NULL,
    [DatArchivage]   SMALLDATETIME   NULL,
    [CleArchiveur]   SMALLINT        NULL,
    [TypMarche]      TINYINT         NOT NULL,
    [TauRemise]      DECIMAL (5, 2)  NULL,
    [DelLivraison]   TINYINT         NULL,
    [LibContrat]     VARCHAR (255)   NULL,
    CONSTRAINT [PK_Sto9_FouMarche] PRIMARY KEY CLUSTERED ([CleMarche] ASC),
    CONSTRAINT [UN_Sto9_FouMarche] UNIQUE NONCLUSTERED ([CodMarche] ASC)
);

