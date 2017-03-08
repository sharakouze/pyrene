CREATE TABLE [SA_TMPI].[LmsP_PrdMatrice] (
    [CleProduit] SMALLINT NOT NULL,
    [CleMatrice] SMALLINT NOT NULL,
    CONSTRAINT [PK_LmsP_MatMatrice] PRIMARY KEY CLUSTERED ([CleProduit] ASC, [CleMatrice] ASC),
    CONSTRAINT [FK1_LmsP_MatMatrice] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK2_LmsP_MatMatrice] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice])
);


GO
CREATE NONCLUSTERED INDEX [ID1_PrdMatrice]
    ON [SA_TMPI].[LmsP_PrdMatrice]([CleProduit] ASC);

