CREATE TABLE [SA_TMPI].[t_MagasinRespon] (
    [CleMagasin] SMALLINT NOT NULL,
    [CleRespon]  SMALLINT NOT NULL,
    CONSTRAINT [PK_t_MagasinRespon] PRIMARY KEY CLUSTERED ([CleMagasin] ASC, [CleRespon] ASC),
    CONSTRAINT [FK1_t_MagasinRespon] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_t_MagasinRespon] FOREIGN KEY ([CleRespon]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

