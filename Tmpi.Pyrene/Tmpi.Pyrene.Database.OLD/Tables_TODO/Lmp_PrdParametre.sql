CREATE TABLE [SA_TMPI].[Lmp_PrdParametre] (
    [ClePrdParametre] INT             IDENTITY (1, 1) NOT NULL,
    [CleProduit]      SMALLINT        NOT NULL,
    [CleGroupeP]      SMALLINT        NOT NULL,
    [CleGroupeP_E]    SMALLINT        NULL,
    [CleParametre_E]  INT             NOT NULL,
    [CleUniteT]       SMALLINT        NULL,
    [NumOrdre]        SMALLINT        CONSTRAINT [DF_Lmp_PrdParametre_NumOrdre] DEFAULT ((0)) NOT NULL,
    [EstOptionnel]    BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [EstObligatoire]  BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstObligatoire] DEFAULT ((0)) NOT NULL,
    [EstAccredite]    BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstAccredite] DEFAULT ((0)) NOT NULL,
    [EstImprimable]   BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstImprimable] DEFAULT ((1)) NOT NULL,
    [EstExportable]   BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstExportable] DEFAULT ((1)) NOT NULL,
    [EstFacturable]   BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstFacturable] DEFAULT ((1)) NOT NULL,
    [ValResultat_N]   DECIMAL (18, 8) NULL,
    [ValResultat_A]   NVARCHAR (255)  NULL,
    [ValResultat_L]   SMALLINT        NULL,
    [CleLaboratoire]  INT             NULL,
    [EstHorsForfait]  BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstHorsForfait] DEFAULT ((0)) NOT NULL,
    [TypUsage]        VARCHAR (1)     NULL,
    [EstQteFacturee]  BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]   BIT             CONSTRAINT [DF_Lmp_PrdParametre_EstPrxFacture] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Lmp_PrdParametre] PRIMARY KEY CLUSTERED ([ClePrdParametre] ASC),
    CONSTRAINT [FK1_Lmp_PrdParametre] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK2_Lmp_PrdParametre] FOREIGN KEY ([CleGroupeP_E]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK3_Lmp_PrdParametre] FOREIGN KEY ([CleParametre_E]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK4_Lmp_PrdParametre] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT]),
    CONSTRAINT [FK5_Lmp_PrdParametre] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [UN_Lmp_PrdParametre] UNIQUE NONCLUSTERED ([CleProduit] ASC, [CleGroupeP] ASC, [CleGroupeP_E] ASC, [CleParametre_E] ASC, [TypUsage] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_PrdParametre]
    ON [SA_TMPI].[Lmp_PrdParametre]([CleProduit] ASC);

