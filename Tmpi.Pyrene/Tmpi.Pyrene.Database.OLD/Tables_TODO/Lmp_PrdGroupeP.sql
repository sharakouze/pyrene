CREATE TABLE [SA_TMPI].[Lmp_PrdGroupeP] (
    [ClePrdGroupeP]    INT             IDENTITY (1, 1) NOT NULL,
    [CleProduit]       SMALLINT        NOT NULL,
    [CleGroupeP]       SMALLINT        NOT NULL,
    [NumOrdre]         SMALLINT        CONSTRAINT [DF_Lmp_PrdGroupeP_NumOrdre] DEFAULT ((999)) NOT NULL,
    [CleSpecification] INT             NULL,
    [EstOptionnel]     BIT             CONSTRAINT [DF_Lmp_PrdGroupeP_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [EstObligatoire]   BIT             CONSTRAINT [DF_Lmp_PrdGroupeP_EstObligatoire] DEFAULT ((0)) NOT NULL,
    [EstFacturable]    BIT             CONSTRAINT [DF_Lmp_PrdGroupeP_EstFacturable] DEFAULT ((1)) NOT NULL,
    [EstForfaitaire]   BIT             CONSTRAINT [DF_Lmp_PrdGroupeP_EstForfaitaire] DEFAULT ((1)) NOT NULL,
    [CleTarif]         SMALLINT        NULL,
    [TypFacturation]   TINYINT         CONSTRAINT [DF_Lmp_PrdGroupeP_TypFacturation] DEFAULT ((0)) NOT NULL,
    [MntForfait]       DECIMAL (10, 2) NULL,
    [CleTVA]           SMALLINT        NULL,
    [CleOrigine]       TINYINT         NULL,
    [CleExterne]       INT             NULL,
    CONSTRAINT [PK_Lmp_PrdGroupeP] PRIMARY KEY CLUSTERED ([ClePrdGroupeP] ASC),
    CONSTRAINT [FK1_Lmp_PrdGroupeP] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK2_Lmp_PrdGroupeP] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [UN_Lmp_PrdGroupeP] UNIQUE NONCLUSTERED ([CleProduit] ASC, [CleGroupeP] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_PrdGroupeP]
    ON [SA_TMPI].[Lmp_PrdGroupeP]([CleProduit] ASC);

