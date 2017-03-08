CREATE TABLE [SA_TMPI].[Aut9_TrvTravail] (
    [CleLot]        INT           NOT NULL,
    [CleTravail]    INT           NOT NULL,
    [TypTravail]    TINYINT       NOT NULL,
    [NivTraitement] TINYINT       NOT NULL,
    [CleAutomate]   SMALLINT      NOT NULL,
    [CleFamille_C]  SMALLINT      NULL,
    [TypSource]     TINYINT       NOT NULL,
    [NumPlaque_S]   VARCHAR (10)  NOT NULL,
    [LstPlaque_S]   VARCHAR (500) NULL,
    [TypCible]      TINYINT       NOT NULL,
    [NumPlaque_C]   VARCHAR (10)  NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Aut9_TrvTravail_DatCreation] DEFAULT (getdate()) NOT NULL,
    [DatEnvoi]      SMALLDATETIME NULL,
    [DatControle]   SMALLDATETIME NULL,
    [NomFichier]    VARCHAR (100) NULL,
    [TxtErreur]     VARCHAR (500) NULL
);

