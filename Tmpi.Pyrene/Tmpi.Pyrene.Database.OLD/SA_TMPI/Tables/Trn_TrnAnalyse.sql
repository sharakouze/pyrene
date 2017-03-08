CREATE TABLE [SA_TMPI].[Trn_TrnAnalyse] (
    [CleTache]       INT             NOT NULL,
    [CleTrnEchant]   INT             NOT NULL,
    [CleTrnAnalyse]  INT             IDENTITY (1, 1) NOT NULL,
    [CleProduit]     SMALLINT        NOT NULL,
    [CleGroupeP]     SMALLINT        NULL,
    [CleParametre]   INT             NOT NULL,
    [ValResultat]    VARCHAR (1000)  NULL,
    [ValResultatN]   DECIMAL (18, 8) NULL,
    [ValResultatD]   DATETIME        NULL,
    [ValResultatL]   INT             NULL,
    [DatRealisation] DATETIME        NULL,
    [CleGroupe]      SMALLINT        NULL,
    [OpeResultat]    NVARCHAR (50)   NULL,
    [CleTache_Old]   INT             NULL,
    [CleInterp]      SMALLINT        NULL,
    [EstActif]       BIT             DEFAULT ((1)) NOT NULL,
    [DatModif]       SMALLDATETIME   NULL,
    [DatCreation]    SMALLDATETIME   CONSTRAINT [DF_Trn_TrnAnalyse_DatCreation] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Trn_TrnAnalyse] PRIMARY KEY CLUSTERED ([CleTrnAnalyse] ASC),
    CONSTRAINT [FK1_Trn_Analyse] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_TrnTache] ([CleTache]),
    CONSTRAINT [FK1_Trn_TrnAnalyse] FOREIGN KEY ([CleTrnEchant]) REFERENCES [SA_TMPI].[Trn_TrnEchant] ([CleTrnEchant]),
    CONSTRAINT [FK2_Trn_TrnAnalyse] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK3_Trn_TrnAnalyse] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK4_Trn_TrnAnalyse] FOREIGN KEY ([CleGroupe]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK5_Trn_TrnAnalyse] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_TrnAnalyse]
    ON [SA_TMPI].[Trn_TrnAnalyse]([CleTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_TrnAnalyse]
    ON [SA_TMPI].[Trn_TrnAnalyse]([CleTrnEchant] ASC);

