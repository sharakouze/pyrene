CREATE TABLE [SA_TMPI].[t_SArtCritere] (
    [ClePerso]   SMALLINT NOT NULL,
    [TypCritere] TINYINT  NOT NULL,
    [CleObjet]   INT      NOT NULL,
    CONSTRAINT [FK1_t_SArtCritere] FOREIGN KEY ([ClePerso]) REFERENCES [SA_TMPI].[t_SArt] ([ClePerso])
);


GO
CREATE NONCLUSTERED INDEX [ID_t_SArtCritere]
    ON [SA_TMPI].[t_SArtCritere]([ClePerso] ASC) WITH (FILLFACTOR = 90);

