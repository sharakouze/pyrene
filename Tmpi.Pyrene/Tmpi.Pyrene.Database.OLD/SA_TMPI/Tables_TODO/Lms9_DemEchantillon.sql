CREATE TABLE [SA_TMPI].[Lms9_DemEchantillon] (
    [CleDemEchantillon]  INT           NOT NULL,
    [CleDemande]         INT           NOT NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon]     VARCHAR (100) NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [TxtEchantillon]     VARCHAR (255) NULL,
    [NbrEchantillon]     SMALLINT      NOT NULL,
    [NumEtiquette]       VARCHAR (50)  NULL,
    [NumLot]             SMALLINT      NULL,
    [ClePointP]          INT           NULL,
    [ClePointS]          INT           NULL,
    [ClePreleveur]       INT           NULL,
    [DatPrelevement]     SMALLDATETIME NULL,
    [CleMatrice]         SMALLINT      NULL,
    [CleDosEchantillon]  INT           NULL,
    [NivTraitement]      TINYINT       NULL,
    CONSTRAINT [PK_Lms9_DemEchantillon] PRIMARY KEY CLUSTERED ([CleDemEchantillon] ASC),
    CONSTRAINT [FK1_Lms9_DemEchantillon] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Lms9_DemDemande] ([CleDemande]),
    CONSTRAINT [FK2_Lms9_DemEchantillon] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [UN_Lms9_DemEchantillon] UNIQUE NONCLUSTERED ([CleDemande] ASC, [NumOrdre] ASC)
);

