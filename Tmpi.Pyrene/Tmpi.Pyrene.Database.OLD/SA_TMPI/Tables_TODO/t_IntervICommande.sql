CREATE TABLE [SA_TMPI].[t_IntervICommande] (
    [CleInterv]    INT NOT NULL,
    [CleICommande] INT NOT NULL,
    CONSTRAINT [FK1_t_IntervICommande] FOREIGN KEY ([CleInterv]) REFERENCES [SA_TMPI].[t_Interv] ([CleInterv])
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_IntervICommande]
    ON [SA_TMPI].[t_IntervICommande]([CleInterv] ASC) WITH (FILLFACTOR = 90);

