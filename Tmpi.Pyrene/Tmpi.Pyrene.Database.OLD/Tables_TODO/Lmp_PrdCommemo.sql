CREATE TABLE [SA_TMPI].[Lmp_PrdCommemo] (
    [CleProduit]     SMALLINT        NOT NULL,
    [CleCommemo]     SMALLINT        NOT NULL,
    [TypCommemo]     TINYINT         CONSTRAINT [DF_Lmp_PrdCommemo_TypCommemo] DEFAULT ((2)) NOT NULL,
    [NumOrdre]       SMALLINT        CONSTRAINT [DF_Lmp_PrdCommemo_NumOrdre] DEFAULT ((0)) NOT NULL,
    [EstOptionnel]   BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [EstObligatoire] BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstObligatoire] DEFAULT ((0)) NOT NULL,
    [EstImprimable]  BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstImprimable] DEFAULT ((1)) NOT NULL,
    [EstExportable]  BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstExportable] DEFAULT ((1)) NOT NULL,
    [EstFacturable]  BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstFacturable] DEFAULT ((0)) NOT NULL,
    [EstQteFacturee] BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstQteFacturee] DEFAULT ((0)) NOT NULL,
    [EstPrxFacture]  BIT             CONSTRAINT [DF_Lmp_PrdCommemo_EstPrxFacture] DEFAULT ((0)) NOT NULL,
    [CleGroupeP]     SMALLINT        NULL,
    [ClePrdCommemo]  INT             IDENTITY (1, 1) NOT NULL,
    [EstHorsForfait] BIT             CONSTRAINT [DF_Lmp_PrdCommemoEstHorsForfait] DEFAULT ((0)) NOT NULL,
    [CleUniteT]      SMALLINT        NULL,
    [EstAccredite]   BIT             CONSTRAINT [DF_Lmp_PrdCommemoEstAccredite] DEFAULT ((0)) NOT NULL,
    [CleLaboratoire] INT             NULL,
    [ValResultat_A]  VARCHAR (255)   NULL,
    [ValResultat_N]  DECIMAL (18, 8) NULL,
    [ValResultat_L]  SMALLINT        NULL,
    CONSTRAINT [PK_Lmp_PrdCommemo] PRIMARY KEY CLUSTERED ([ClePrdCommemo] ASC),
    CONSTRAINT [FK1_Lmp_PrdCommemo] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK2_Lmp_PrdCommemo] FOREIGN KEY ([CleCommemo]) REFERENCES [SA_TMPI].[Lmp_ComCommemo] ([CleCommemo]),
    CONSTRAINT [FK3_Lmp_PrdCommemo] FOREIGN KEY ([CleUniteT]) REFERENCES [SA_TMPI].[Lmp_UniUniteT] ([CleUniteT]),
    CONSTRAINT [FK4_Lmp_PrdCommemo] FOREIGN KEY ([CleLaboratoire]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [UN_Lmp_PrdCommemo] UNIQUE NONCLUSTERED ([CleProduit] ASC, [CleGroupeP] ASC, [CleCommemo] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_PrdCommemo]
    ON [SA_TMPI].[Lmp_PrdCommemo]([CleProduit] ASC);

