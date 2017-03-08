CREATE TABLE [SA_TMPI].[Lmp_UniSubstrat] (
    [CleSubstrat]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleSubstrat_C] SMALLINT      NULL,
    [CleSubstrat_H] SMALLINT      NOT NULL,
    [CodSubstrat]   VARCHAR (50)  NOT NULL,
    [LibSubstrat]   VARCHAR (100) NOT NULL,
    [TxtSubstrat]   VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_UniSubstrat_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_UniSubstrat_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_UniSubstrat_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL
);

