CREATE TABLE [SA_TMPI].[Lmp_Dos_VldValidation] (
    [CleValidation]           SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleValidation_C]         SMALLINT      NULL,
    [CleValidation_H]         SMALLINT      NOT NULL,
    [CodValidation]           VARCHAR (50)  NOT NULL,
    [LibValidation]           VARCHAR (100) NOT NULL,
    [PrcCtlDosEnregistrement] VARCHAR (50)  NULL,
    [PrcCtlDosValidation]     VARCHAR (50)  NULL,
    [PrcCtlResBorne]          VARCHAR (50)  NULL,
    [PrcCtlResLimite]         VARCHAR (50)  NULL,
    [EstActif]                BIT           CONSTRAINT [DF_Lmp_Dos_VldValidation_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]             SMALLDATETIME CONSTRAINT [DF_Lmp_Dos_VldValidation_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]             SMALLINT      CONSTRAINT [DF_Lmp_Dos_VldValidation_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]                SMALLDATETIME NULL,
    [CleOperateur]            SMALLINT      NULL,
    [DatValidation]           SMALLDATETIME NULL,
    [CleValideur]             SMALLINT      NULL,
    [CleExterne]              INT           NULL,
    [CleOrigine]              SMALLINT      NULL,
    [PrcCtlDosCreation]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_Lmp_Dos_VldValidation] PRIMARY KEY CLUSTERED ([CleValidation] ASC),
    CONSTRAINT [UN_Lmp_Dos_VldValidation] UNIQUE NONCLUSTERED ([CodValidation] ASC)
);

