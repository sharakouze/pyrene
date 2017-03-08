CREATE TABLE [SA_TMPI].[LmsP_GrpCommemo] (
    [CleGroupeP]     SMALLINT NOT NULL,
    [CleGrpCommemo]  SMALLINT IDENTITY (1, 1) NOT NULL,
    [CleGroupe]      SMALLINT NOT NULL,
    [CleCommemo]     SMALLINT NOT NULL,
    [CleUniteT]      SMALLINT NULL,
    [NumOrdre]       SMALLINT CONSTRAINT [DF_LmsP_GrpCommemo_NumOrdre] DEFAULT ((0)) NOT NULL,
    [EstOptionnel]   BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [EstObligatoire] BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstObligatoire] DEFAULT ((0)) NOT NULL,
    [EstAccredite]   BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstAccredite] DEFAULT ((0)) NOT NULL,
    [EstImprimable]  BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstImprimable] DEFAULT ((1)) NOT NULL,
    [EstExportable]  BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstExportable] DEFAULT ((1)) NOT NULL,
    [EstFacturable]  BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstFacturable] DEFAULT ((1)) NOT NULL,
    [CleExterne]     INT      NULL,
    [CleOrigine]     TINYINT  NULL,
    [CleLaboratoire] INT      NULL,
    [EstHorsForfait] BIT      CONSTRAINT [DF_LmsP_GrpCommemo_EstHorsForfait] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_LmsP_GrpCommemo] PRIMARY KEY CLUSTERED ([CleGrpCommemo] ASC),
    CONSTRAINT [FK1_LmsP_GrpCommemo] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK10_LmsP_GrpCommemo] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT]),
    CONSTRAINT [FK2_LmsP_GrpCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo]),
    CONSTRAINT [UN_LmsP_GrpCommemo] UNIQUE NONCLUSTERED ([CleGroupeP] ASC, [CleGroupe] ASC, [CleCommemo] ASC)
);

