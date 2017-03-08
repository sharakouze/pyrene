CREATE TABLE [SA_TMPI].[Edi9_DemEchantillon] (
    [CleEdiEchantillon]  INT           NOT NULL,
    [CleEdiDemande]      INT           NOT NULL,
    [CleEdiPrelevement]  INT           NULL,
    [NumOrdre]           SMALLINT      NOT NULL,
    [NumEchantillon]     VARCHAR (100) NULL,
    [NumEchantillon_Ext] VARCHAR (100) NULL,
    [TxtEchantillon]     VARCHAR (255) NULL,
    [NbrEchantillon]     SMALLINT      NOT NULL,
    [NumEtiquette]       VARCHAR (50)  NULL,
    [NumLot]             SMALLINT      NULL,
    [DatPrelevement]     SMALLDATETIME NULL,
    [ClePreleveur]       INT           NULL,
    [ClePreleveur_Ref]   INT           NULL,
    [CleMatrice]         INT           NULL,
    [CleMatrice_Ref]     INT           NULL,
    CONSTRAINT [PK_Edi9_DemEchantillon] PRIMARY KEY CLUSTERED ([CleEdiEchantillon] ASC),
    CONSTRAINT [FK1_Edi9_DemEchantillon] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi9_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi9_DemEchantillon] FOREIGN KEY ([CleEdiPrelevement]) REFERENCES [SA_TMPI].[Edi9_DemPrelevement] ([CleEdiPrelevement]),
    CONSTRAINT [UN_Edi9_DemEchantillon] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [NumOrdre] ASC)
);

