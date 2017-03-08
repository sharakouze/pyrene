CREATE TABLE [SA_TMPI].[Trn_DemAlerte] (
    [CleDemAlerte]    INT           IDENTITY (1, 1) NOT NULL,
    [CleDemTache]     INT           NOT NULL,
    [TxtAlerte]       VARCHAR (255) NULL,
    [TypAlerte]       TINYINT       NOT NULL,
    [DatDebut]        SMALLDATETIME NOT NULL,
    [DatFin]          SMALLDATETIME NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Trn_DemAlerte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatFinalisation] SMALLDATETIME NULL,
    [CleFinaliseur]   SMALLINT      NULL,
    CONSTRAINT [FK1_Trn_DemAlerte] FOREIGN KEY ([CleDemTache]) REFERENCES [SA_TMPI].[Trn_DemTache] ([CleDemTache])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemAlerte]
    ON [SA_TMPI].[Trn_DemAlerte]([CleDemTache] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_DemAlerte]
    ON [SA_TMPI].[Trn_DemAlerte]([TypAlerte] ASC);

