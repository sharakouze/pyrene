CREATE TABLE [SA_TMPI].[Lmp_Par_Interp] (
    [CleInterp]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleInterp_C]   SMALLINT      NULL,
    [CleInterp_H]   SMALLINT      NOT NULL,
    [CodInterp]     VARCHAR (50)  NOT NULL,
    [LibInterp]     VARCHAR (100) NOT NULL,
    [TxtInterp]     VARCHAR (255) NULL,
    [ValQualif]     TINYINT       CONSTRAINT [DF_Lmp_Par_Interp_ValQualif] DEFAULT ((99)) NOT NULL,
    [NumOrdre]      TINYINT       CONSTRAINT [DF_Lmp_Par_Interp_NumOrdre] DEFAULT ((0)) NOT NULL,
    [LettreSymbole] CHAR (1)      NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_Par_Interp_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_Par_Interp_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_Par_Interp_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Lmp_Par_Interp] PRIMARY KEY CLUSTERED ([CleInterp] ASC),
    CONSTRAINT [UN_Lmp_Par_Interp] UNIQUE NONCLUSTERED ([CodInterp] ASC)
);

