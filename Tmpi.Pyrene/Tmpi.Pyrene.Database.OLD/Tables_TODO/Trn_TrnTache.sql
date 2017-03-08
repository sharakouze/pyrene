CREATE TABLE [SA_TMPI].[Trn_TrnTache] (
    [CleTournee]         INT            NULL,
    [CleDemTache]        INT            NOT NULL,
    [TxtTache]           VARCHAR (4000) NULL,
    [ClePoint]           INT            NOT NULL,
    [NbrEchant]          TINYINT        NOT NULL,
    [CleProduit]         SMALLINT       NOT NULL,
    [CleMatrice]         SMALLINT       NULL,
    [NumJour]            TINYINT        NULL,
    [DatPrevue]          SMALLDATETIME  NULL,
    [HeuPrevue]          SMALLINT       NULL,
    [NumOrdre]           SMALLINT       NULL,
    [DatDebut]           SMALLDATETIME  NOT NULL,
    [DatFin]             SMALLDATETIME  NOT NULL,
    [ClePreleveur]       SMALLINT       NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [DatRealisation]     DATETIME       NULL,
    [CleDemande]         INT            NULL,
    [CleSecteur]         SMALLINT       NOT NULL,
    [TxtDate]            VARCHAR (100)  NULL,
    [NumOrdreReal]       SMALLINT       NULL,
    [HeuRealisation]     SMALLINT       NULL,
    [EstNumerote]        BIT            CONSTRAINT [DF_Trn_TrnTache_EstNumerote] DEFAULT ((0)) NOT NULL,
    [CleTache_Old]       INT            NULL,
    [CleTache]           INT            NOT NULL,
    [DatActualisation]   SMALLDATETIME  NULL,
    [SttTache]           TINYINT        NULL,
    [CleRegroupement]    INT            NULL,
    [EstUnRegroupement]  BIT            CONSTRAINT [DF_Trn_TrnTache_EstUnRegroupement] DEFAULT ((0)) NOT NULL,
    [EstSynchroOptiTime] BIT            NULL,
    [TypOrigine]         TINYINT        CONSTRAINT [DF_Trn_TrnTache_TypOrigine] DEFAULT ((0)) NOT NULL,
    [NumTache]           AS             (CONVERT([varchar](50),[CleTache],0)) PERSISTED,
    [EstActif]           BIT            DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF_Trn_TrnTache_DatCreation] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Trn_TrnTache] PRIMARY KEY CLUSTERED ([CleTache] ASC),
    CONSTRAINT [FK1_Trn_TrnTache] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Trn_DemDemande] ([CleDemande]),
    CONSTRAINT [FK2_Trn_TrnTache] FOREIGN KEY ([CleTache]) REFERENCES [SA_TMPI].[Trn_DemTache] ([CleDemTache]),
    CONSTRAINT [FK3_Trn_TrnTache] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [FK4_Trn_TrnTache] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK5_Trn_TrnTache] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK6_Trn_TrnTache] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint]),
    CONSTRAINT [FK7_Trn_TrnTache] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK8_Trn_TrnTache] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [ID7_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([DatDebut] ASC);


GO
CREATE NONCLUSTERED INDEX [ID8_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([DatFin] ASC);


GO
CREATE NONCLUSTERED INDEX [ID9_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([DatPrevue] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([CleDemTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([CleProduit] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([ClePoint] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([CleSecteur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID6_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [IDX_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([DatRealisation] ASC, [CleSecteur] ASC, [CleTournee] ASC, [ClePreleveur] ASC);


GO
CREATE NONCLUSTERED INDEX [ID13_Trn_TrnTache]
    ON [SA_TMPI].[Trn_TrnTache]([SttTache] ASC);

