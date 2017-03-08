CREATE TABLE [SA_TMPI].[Lmp_ClsClasse] (
    [CleClasse]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleClasse_C]   SMALLINT       NULL,
    [CleClasse_H]   SMALLINT       NOT NULL,
    [CodClasse]     VARCHAR (100)  NOT NULL,
    [LibClasse]     VARCHAR (200)  NOT NULL,
    [TxtClasse]     VARCHAR (1000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_ClsClasse_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_ClsClasse_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Lmp_ClsClasse_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    CONSTRAINT [PK_Lmp_ClsClasse] PRIMARY KEY CLUSTERED ([CleClasse] ASC),
    CONSTRAINT [UN_Lmp_ClsClasse] UNIQUE NONCLUSTERED ([CleClasse_H] ASC, [CodClasse] ASC)
);

