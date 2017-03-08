CREATE TABLE [SA_TMPI].[t_DomaineRespon] (
    [CleDomaine] SMALLINT NOT NULL,
    [CleRespon]  SMALLINT NOT NULL,
    CONSTRAINT [PK_t_DomaineRespon] PRIMARY KEY CLUSTERED ([CleDomaine] ASC, [CleRespon] ASC),
    CONSTRAINT [FK1_t_DomaineRespon] FOREIGN KEY ([CleDomaine]) REFERENCES [SA_TMPI].[t_Domaine] ([CleDomaine]),
    CONSTRAINT [FK2_t_DomaineRespon] FOREIGN KEY ([CleRespon]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

