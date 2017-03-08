CREATE TABLE [SA_TMPI].[Lmp_GrpInterp] (
    [CleGroupeP]        INT      NOT NULL,
    [CleGrpInterp]      INT      IDENTITY (1, 1) NOT NULL,
    [CodMAM]            SMALLINT NULL,
    [NumLigne]          TINYINT  NOT NULL,
    [CleInterpMAM1]     SMALLINT NULL,
    [CleInterpMAM2]     SMALLINT NULL,
    [CleInterpMAM3]     SMALLINT NULL,
    [CleInterpMAM4]     SMALLINT NULL,
    [CleInterpMAM5]     SMALLINT NULL,
    [CleInterpMAM6]     SMALLINT NULL,
    [CleInterpMAM7]     SMALLINT NULL,
    [CleInterpMAM8]     SMALLINT NULL,
    [CleInterpMAM9]     SMALLINT NULL,
    [CleInterpResultat] TINYINT  NULL,
    CONSTRAINT [PK_Lmp_GrpInterp] PRIMARY KEY CLUSTERED ([CleGrpInterp] ASC)
);

