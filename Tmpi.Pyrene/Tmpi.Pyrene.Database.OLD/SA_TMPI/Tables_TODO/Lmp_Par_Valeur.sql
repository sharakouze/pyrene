CREATE TABLE [SA_TMPI].[Lmp_Par_Valeur] (
    [CleValeur]         SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleValeur_C]       SMALLINT       NULL,
    [CleValeur_H]       SMALLINT       NOT NULL,
    [CodValeur]         VARCHAR (50)   NOT NULL,
    [LibValeur]         VARCHAR (255)  NULL,
    [TxtValeur]         NVARCHAR (255) NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [DatValidation]     DATETIME       NULL,
    [CleValideur]       SMALLINT       NULL,
    [EstActif]          BIT            CONSTRAINT [DF_Lmp_Par_Valeur_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME  CONSTRAINT [DF_Lmp_Par_Valeur_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT       CONSTRAINT [DF_Lmp_Par_Valeur_CleCreateur] DEFAULT ((0)) NOT NULL,
    [CleExterne]        INT            NULL,
    [CleOrigine]        INT            NULL,
    [CleInterpretation] SMALLINT       NULL,
    [TypValeur]         TINYINT        CONSTRAINT [DF_Lmp_Par_Valeur_TypValeur] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Lmp_Par_Valeur] PRIMARY KEY CLUSTERED ([CleValeur] ASC),
    CONSTRAINT [UN_Lmp_Par_Valeur] UNIQUE NONCLUSTERED ([LibValeur] ASC, [TypValeur] ASC)
);

