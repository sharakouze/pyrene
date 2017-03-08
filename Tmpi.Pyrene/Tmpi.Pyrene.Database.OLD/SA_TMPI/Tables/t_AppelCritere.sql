CREATE TABLE [SA_TMPI].[t_AppelCritere] (
    [CleAppel]   SMALLINT NOT NULL,
    [TypCritere] TINYINT  NOT NULL,
    [CleObjet]   INT      NOT NULL,
    CONSTRAINT [FK1_t_AppelCritere] FOREIGN KEY ([CleAppel]) REFERENCES [SA_TMPI].[t_Appel] ([CleAppel])
);


GO
CREATE NONCLUSTERED INDEX [ID_t_AppelCritere]
    ON [SA_TMPI].[t_AppelCritere]([CleAppel] ASC) WITH (FILLFACTOR = 90);

