CREATE TABLE [SA_TMPI].[Equ_Rsv_Planning] (
    [CleReservation] INT           IDENTITY (1, 1) NOT NULL,
    [CleRessource]   INT           NOT NULL,
    [ClePersonne]    SMALLINT      NOT NULL,
    [DatDebut]       SMALLDATETIME NOT NULL,
    [DatFin]         SMALLDATETIME NOT NULL,
    [TxtReservation] VARCHAR (255) NULL,
    CONSTRAINT [PK_Equ_Rsv_Planning] PRIMARY KEY CLUSTERED ([CleReservation] ASC)
);

