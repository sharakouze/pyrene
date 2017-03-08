CREATE TABLE [SA_TMPI].[t_EquAtelierRespon] (
    [CleAtelier] SMALLINT NOT NULL,
    [CleRespon]  SMALLINT NOT NULL,
    CONSTRAINT [PK_t_EquAtelierRespon] PRIMARY KEY CLUSTERED ([CleAtelier] ASC, [CleRespon] ASC),
    CONSTRAINT [FK1_t_EquAtelierRespon] FOREIGN KEY ([CleAtelier]) REFERENCES [SA_TMPI].[t_EquAtelier] ([CleAtelier]),
    CONSTRAINT [FK2_t_EquAtelierRespon] FOREIGN KEY ([CleRespon]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

