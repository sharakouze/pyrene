CREATE TABLE [SA_TMPI].[Trn9_TrnReservation] (
    [CleTournee]    INT           NOT NULL,
    [CleFamille]    SMALLINT      NOT NULL,
    [CleEquipement] INT           NOT NULL,
    [DatDebut]      SMALLDATETIME NOT NULL,
    [DatFin]        SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Trn9_TrnReservation] PRIMARY KEY CLUSTERED ([CleEquipement] ASC, [CleTournee] ASC)
);

