CREATE TABLE [SA_TMPI].[Lmp_Met_Interpretation] (
    [CleMethode]          SMALLINT NOT NULL,
    [CleInterpretation_1] SMALLINT NULL,
    [CleInterpretation_2] SMALLINT NULL,
    [CleInterpretation_3] SMALLINT NULL,
    [CleInterpretation_4] SMALLINT NULL,
    [CleInterpretation_5] SMALLINT NULL,
    CONSTRAINT [PK_Lmp_Met_Interpretation] PRIMARY KEY CLUSTERED ([CleMethode] ASC)
);

