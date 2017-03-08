CREATE TABLE [SA_TMPI].[Lmp_UniUniteT] (
    [CleUniteT]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleUniteT_C]   SMALLINT      NULL,
    [CleUniteT_H]   SMALLINT      NOT NULL,
    [CodUniteT]     VARCHAR (50)  NOT NULL,
    [LibUniteT]     VARCHAR (100) NOT NULL,
    [TxtUniteT]     VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_UniUniteT_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_UniUniteT_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_UniUniteT_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Lmp_UniUniteT] PRIMARY KEY CLUSTERED ([CleUniteT] ASC),
    CONSTRAINT [UN_Lmp_UniUniteT] UNIQUE NONCLUSTERED ([CodUniteT] ASC)
);

