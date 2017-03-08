CREATE TABLE [SA_TMPI].[Bdg_EngEngagement] (
    [CleBudget]      SMALLINT      NOT NULL,
    [CleSection]     SMALLINT      NOT NULL,
    [CleAction]      SMALLINT      NOT NULL,
    [CleFournisseur] SMALLINT      NOT NULL,
    [CleEngagement]  SMALLINT      IDENTITY (1, 1) NOT NULL,
    [NumEngagement]  VARCHAR (50)  NOT NULL,
    [LibEngagement]  VARCHAR (100) NOT NULL,
    [TxtEngagement]  VARCHAR (255) NULL,
    [DatCreation]    SMALLDATETIME CONSTRAINT [DF_Bdg_EngEngagement_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT      NOT NULL,
    [DatModif]       SMALLDATETIME NULL,
    [CleOperateur]   SMALLINT      NULL,
    [DatValidation]  SMALLDATETIME NULL,
    [CleValideur]    SMALLINT      NULL,
    CONSTRAINT [PK_Bdg_EngEngagement] PRIMARY KEY CLUSTERED ([CleEngagement] ASC),
    CONSTRAINT [UN_Bdg_EngEngagement] UNIQUE NONCLUSTERED ([NumEngagement] ASC)
);

