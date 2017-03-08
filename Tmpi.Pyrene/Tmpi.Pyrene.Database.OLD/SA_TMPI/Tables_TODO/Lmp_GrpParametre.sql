CREATE TABLE [SA_TMPI].[Lmp_GrpParametre] (
    [CleGroupeP]        SMALLINT    NOT NULL,
    [CleGrpParametre]   SMALLINT    IDENTITY (1, 1) NOT NULL,
    [CleGroupe]         SMALLINT    NULL,
    [CleParametre]      INT         NOT NULL,
    [NumMAM]            TINYINT     NULL,
    [CleUniteT]         SMALLINT    NULL,
    [NumOrdre]          SMALLINT    CONSTRAINT [DF_Lmp_GrpParametre_NumOrdre] DEFAULT ((0)) NOT NULL,
    [EstOptionnel]      BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [EstObligatoire]    BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstObligatoire] DEFAULT ((0)) NOT NULL,
    [EstAccredite]      BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstAccredite] DEFAULT ((0)) NOT NULL,
    [EstImprimable]     BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstImprimable] DEFAULT ((1)) NOT NULL,
    [EstExportable]     BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstExportable] DEFAULT ((1)) NOT NULL,
    [EstFacturable]     BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstFacturable] DEFAULT ((1)) NOT NULL,
    [CleExterne]        INT         NULL,
    [CleOrigine]        TINYINT     NULL,
    [CleLaboratoire]    INT         NULL,
    [EstHorsForfait]    BIT         CONSTRAINT [DF_Lmp_GrpParametre_EstHorsForfait] DEFAULT ((0)) NOT NULL,
    [TypUsage]          VARCHAR (1) NULL,
    [CleValeur_D]       SMALLINT    NULL,
    [CleGrpParametre_D] INT         NULL,
    [EstQteFacturee]    BIT         CONSTRAINT [DF_Lmp_GrpParametreEstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]     BIT         CONSTRAINT [DF_Lmp_GrpParametreEstPrxFacture] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Lmp_GrpParametre] PRIMARY KEY CLUSTERED ([CleGrpParametre] ASC),
    CONSTRAINT [FK1_Lmp_GrpParametre] FOREIGN KEY ([CleGroupe]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK2_Lmp_GrpParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK3_Lmp_GrpParametre] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT]),
    CONSTRAINT [FK4_Lmp_GrpParametre] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [UN_Lmp_GrpParametre] UNIQUE NONCLUSTERED ([CleGroupeP] ASC, [CleGroupe] ASC, [CleParametre] ASC, [TypUsage] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_GrpParametre]
    ON [SA_TMPI].[Lmp_GrpParametre]([CleGroupeP] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lmp_GrpParametre]
    ON [SA_TMPI].[Lmp_GrpParametre]([CleGroupe] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Lmp_GrpParametre]
    ON [SA_TMPI].[Lmp_GrpParametre]([CleParametre] ASC);

