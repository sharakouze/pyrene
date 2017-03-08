CREATE TABLE [SA_TMPI].[Lmp_MotProduit] (
    [CleMotif]   SMALLINT NOT NULL,
    [CleProduit] SMALLINT NOT NULL,
    CONSTRAINT [PK_Lmp_MotProduit] PRIMARY KEY CLUSTERED ([CleMotif] ASC, [CleProduit] ASC),
    CONSTRAINT [FK1_Lmp_MotProduit] FOREIGN KEY ([CleMotif]) REFERENCES [SA_TMPI].[Lmp_MotMotif] ([CleMotif]),
    CONSTRAINT [FK2_Lmp_MotProduit] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit])
);

