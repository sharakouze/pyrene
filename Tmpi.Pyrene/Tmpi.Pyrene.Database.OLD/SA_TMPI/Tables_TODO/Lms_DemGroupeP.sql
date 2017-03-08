CREATE TABLE [SA_TMPI].[Lms_DemGroupeP] (
    [CleDemGroupeP]     INT           IDENTITY (1, 1) NOT NULL,
    [CleDemande]        INT           NOT NULL,
    [CleDemEchantillon] INT           NULL,
    [CleGroupeP]        SMALLINT      NOT NULL,
    [DatDebut]          SMALLDATETIME NULL,
    [DatFin]            SMALLDATETIME NULL,
    [TxtGroupeP]        VARCHAR (255) NULL,
    CONSTRAINT [PK_Lms_DemGroupeP] PRIMARY KEY CLUSTERED ([CleDemGroupeP] ASC),
    CONSTRAINT [FK1_Lms_DemGroupeP] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Lms_DemDemande] ([CleDemande]),
    CONSTRAINT [FK2_Lms_DemGroupeP] FOREIGN KEY ([CleDemEchantillon]) REFERENCES [SA_TMPI].[Lms_DemEchantillon] ([CleDemEchantillon]),
    CONSTRAINT [FK3_Lms_DemGroupeP] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [UN_Lms_DemGroupeP] UNIQUE NONCLUSTERED ([CleDemande] ASC, [CleDemEchantillon] ASC, [CleGroupeP] ASC)
);

