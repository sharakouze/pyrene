CREATE TABLE [SA_TMPI].[Sto_EcoReservation] (
    [CleEcoReservation] INT IDENTITY (1, 1) NOT NULL,
    [CleCommande]       INT NOT NULL,
    [CleComLigne]       INT NOT NULL,
    [CleDemLigne]       INT NOT NULL,
    [QteReservee]       INT NOT NULL,
    [QteALivrer]        INT NOT NULL,
    [QteLivree]         INT CONSTRAINT [DF_Sto_EcoReservation_QteLivree] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Sto_EcoReservation] PRIMARY KEY CLUSTERED ([CleEcoReservation] ASC),
    CONSTRAINT [FK1_Sto_EcoReservation] FOREIGN KEY ([CleCommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande]),
    CONSTRAINT [FK2_Sto_EcoReservation] FOREIGN KEY ([CleComLigne]) REFERENCES [SA_TMPI].[t_ECommandeLig] ([CleECommandeLig]),
    CONSTRAINT [FK3_Sto_EcoReservation] FOREIGN KEY ([CleDemLigne]) REFERENCES [SA_TMPI].[Sto_DemLigne] ([CleDemLigne])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_EcoReservation]
    ON [SA_TMPI].[Sto_EcoReservation]([CleCommande] ASC);

