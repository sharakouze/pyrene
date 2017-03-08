CREATE TABLE [SA_TMPI].[Edi9_DemGroupeP] (
    [CleEdiGroupeP]     INT           NOT NULL,
    [CleEdiDemande]     INT           NOT NULL,
    [CleEdiEchantillon] INT           NOT NULL,
    [CleGroupeP]        INT           NULL,
    [CleGroupeP_Ref]    INT           NOT NULL,
    [DatDebut]          SMALLDATETIME NULL,
    [DatFin]            SMALLDATETIME NULL,
    [TxtGroupeP]        VARCHAR (255) NULL,
    CONSTRAINT [PK_Edi9_DemGroupeP] PRIMARY KEY CLUSTERED ([CleEdiGroupeP] ASC),
    CONSTRAINT [FK1_Edi9_DemGroupeP] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi9_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi9_DemGroupeP] FOREIGN KEY ([CleEdiEchantillon]) REFERENCES [SA_TMPI].[Edi9_DemEchantillon] ([CleEdiEchantillon]),
    CONSTRAINT [UN_Edi9_DemGroupeP] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [CleEdiEchantillon] ASC, [CleGroupeP_Ref] ASC)
);

