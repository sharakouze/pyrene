CREATE TABLE [SA_TMPI].[Gen_Trs_Civilite] (
    [CleCivilite]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodCivilite]   VARCHAR (50)   NOT NULL,
    [LibCivilite]   VARCHAR (100)  NOT NULL,
    [DatModif]      SMALLDATETIME  NOT NULL,
    [CleOperateur]  SMALLINT       NOT NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [EstActif]      BIT            NULL,
    [TxtCivilite]   VARCHAR (1000) NULL,
    CONSTRAINT [PK_Gen_Civilite] PRIMARY KEY CLUSTERED ([CleCivilite] ASC),
    CONSTRAINT [UN_Gen_Civilite] UNIQUE NONCLUSTERED ([CodCivilite] ASC)
);

