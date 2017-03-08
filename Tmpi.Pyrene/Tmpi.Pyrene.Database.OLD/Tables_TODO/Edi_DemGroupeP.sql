CREATE TABLE [SA_TMPI].[Edi_DemGroupeP] (
    [CleEdiGroupeP]     INT           IDENTITY (1, 1) NOT NULL,
    [CleEdiDemande]     INT           NOT NULL,
    [CleEdiEchantillon] INT           NOT NULL,
    [CleGroupeP]        INT           NULL,
    [CleGroupeP_Ref]    INT           NOT NULL,
    [DatDebut]          SMALLDATETIME NULL,
    [DatFin]            SMALLDATETIME NULL,
    [TxtGroupeP]        VARCHAR (255) NULL,
    CONSTRAINT [PK_Edi_DemGroupeP] PRIMARY KEY CLUSTERED ([CleEdiGroupeP] ASC),
    CONSTRAINT [FK1_Edi_DemGroupeP] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [FK2_Edi_DemGroupeP] FOREIGN KEY ([CleEdiEchantillon]) REFERENCES [SA_TMPI].[Edi_DemEchantillon] ([CleEdiEchantillon]),
    CONSTRAINT [UN_Edi_DemGroupeP] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [CleEdiEchantillon] ASC, [CleGroupeP_Ref] ASC)
);

