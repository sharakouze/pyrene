CREATE TABLE [SA_TMPI].[Aup_AutAutomate] (
    [CleAutomate]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleAutomate_C]     SMALLINT      NULL,
    [CleAutomate_H]     SMALLINT      NOT NULL,
    [CodAutomate]       VARCHAR (50)  NOT NULL,
    [LibAutomate]       VARCHAR (100) NOT NULL,
    [TxtAutomate]       VARCHAR (255) NULL,
    [EstActif]          BIT           CONSTRAINT [DF_Aup_AutAutomate_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_Aup_AutAutomate_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT      NOT NULL,
    [DatModif]          SMALLDATETIME NULL,
    [CleOperateur]      SMALLINT      NULL,
    [DatValidation]     SMALLDATETIME NULL,
    [CleValideur]       SMALLINT      NULL,
    [EstResultatInterp] BIT           CONSTRAINT [DF_Aup_AutAutomate_EstResultatInterp] DEFAULT ((0)) NOT NULL,
    [TypAutomate]       TINYINT       NOT NULL,
    CONSTRAINT [PK_Aup_AutAutomate] PRIMARY KEY CLUSTERED ([CleAutomate] ASC),
    CONSTRAINT [UN_Aup_AutAutomate] UNIQUE NONCLUSTERED ([CodAutomate] ASC)
);

