CREATE TABLE [SA_TMPI].[Aut_TrvTravail] (
    [CleTravail]    INT           IDENTITY (1, 1) NOT NULL,
    [NivTraitement] TINYINT       NOT NULL,
    [CleAutomate]   SMALLINT      NOT NULL,
    [TypSource]     TINYINT       NOT NULL,
    [TypCible]      TINYINT       NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Aut_TrvTravail_DatCreation] DEFAULT (getdate()) NOT NULL,
    [DatEnvoi]      SMALLDATETIME NULL,
    [DatControle]   SMALLDATETIME NULL,
    [TxtErreur]     VARCHAR (500) NULL,
    [CleLot]        INT           NULL,
    [NumPlaque_S]   VARCHAR (10)  NULL,
    [LstPlaque_S]   VARCHAR (500) NULL,
    [NumPlaque_C]   VARCHAR (10)  NULL,
    [NomFichier]    VARCHAR (100) NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [TypTravail]    TINYINT       CONSTRAINT [DF_Aut_TrvTravail_TypTravail] DEFAULT ((0)) NOT NULL,
    [LstParametre]  VARCHAR (200) NULL
);

