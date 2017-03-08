CREATE TABLE [SA_TMPI].[Lmp_Spc_Interpretation] (
    [CleInterpretation]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleInterpretation_C] SMALLINT       NULL,
    [CleInterpretation_H] SMALLINT       NULL,
    [CodInterpretation]   VARCHAR (100)  NOT NULL,
    [LibInterpretation]   VARCHAR (200)  NOT NULL,
    [TxtInterpretation]   VARCHAR (1000) NULL,
    [CleInterpretation1]  SMALLINT       NULL,
    [CleInterpretation2]  SMALLINT       NULL,
    [CleInterpretation3]  SMALLINT       NULL,
    [EstActif]            BIT            CONSTRAINT [DF_Lmp_Spc_Interpretation_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]         SMALLDATETIME  CONSTRAINT [DF_Lmp_Spc_Interpretation_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]         SMALLINT       CONSTRAINT [DF_Lmp_Spc_Interpretation_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]            SMALLDATETIME  NULL,
    [CleOperateur]        SMALLINT       NULL,
    [DatValidation]       SMALLDATETIME  NULL,
    [CleValideur]         SMALLINT       NULL,
    CONSTRAINT [PK_Lmp_Spc_Interpretation] PRIMARY KEY CLUSTERED ([CleInterpretation] ASC),
    CONSTRAINT [FK1_Lmp_Spc_Interpretation] FOREIGN KEY ([CleInterpretation1]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [FK2_Lmp_Spc_Interpretation] FOREIGN KEY ([CleInterpretation2]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [FK3_Lmp_Spc_Interpretation] FOREIGN KEY ([CleInterpretation3]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [UN_Lmp_Spc_Interpretation] UNIQUE NONCLUSTERED ([CodInterpretation] ASC)
);

