CREATE TABLE [SA_TMPI].[Bdg_Bdg_Section] (
    [CleSection]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleSection_C]  SMALLINT      NULL,
    [CleSection_H]  SMALLINT      NOT NULL,
    [CodSection]    VARCHAR (50)  NOT NULL,
    [LibSection]    VARCHAR (100) NOT NULL,
    [TxtSection]    VARCHAR (255) NULL,
    [TxtCritere1]   VARCHAR (100) NULL,
    [TxtCritere2]   VARCHAR (100) NULL,
    [TxtCritere3]   VARCHAR (100) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Bdg_Bdg_Section_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Bdg_Bdg_Section_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_Bdg_Section] PRIMARY KEY CLUSTERED ([CleSection] ASC),
    CONSTRAINT [UN_Bdg_Bdg_Section] UNIQUE NONCLUSTERED ([CodSection] ASC)
);

