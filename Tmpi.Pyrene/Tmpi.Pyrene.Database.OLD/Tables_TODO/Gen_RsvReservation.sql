CREATE TABLE [SA_TMPI].[Gen_RsvReservation] (
    [CleReservation] INT           IDENTITY (1, 1) NOT NULL,
    [CleRessource_H] SMALLINT      NOT NULL,
    [CleRessource_M] SMALLINT      NOT NULL,
    [CleRessource_C] SMALLINT      NOT NULL,
    [DatDebut]       SMALLDATETIME NOT NULL,
    [DatFin]         SMALLDATETIME NULL,
    [HeuDebut]       SMALLINT      NULL,
    [HeuFin]         SMALLINT      NULL,
    [DatCreation]    SMALLDATETIME CONSTRAINT [DF_Gen_RsvReservation_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT      NOT NULL,
    CONSTRAINT [PK_Gen_RsvReservation] PRIMARY KEY CLUSTERED ([CleReservation] ASC)
);

