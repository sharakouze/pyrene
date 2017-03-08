CREATE TABLE [SA_TMPI].[Lmp_PrdRessource] (
    [CleProduit]      SMALLINT NOT NULL,
    [CleService]      SMALLINT NOT NULL,
    [QteRessource]    TINYINT  NOT NULL,
    [ClePrdRessource] INT      IDENTITY (1, 1) NOT NULL,
    [CleFamille]      SMALLINT NOT NULL,
    [CleRessource]    SMALLINT NULL,
    [TypRessource]    TINYINT  NOT NULL,
    CONSTRAINT [PK_Lmp_PrdRessource] PRIMARY KEY CLUSTERED ([CleFamille] ASC, [CleProduit] ASC, [CleService] ASC),
    CONSTRAINT [FK1_Lmp_PrdRessource] FOREIGN KEY ([CleProduit]) REFERENCES [SA_TMPI].[Lmp_PrdProduit] ([CleProduit]),
    CONSTRAINT [FK2_Lmp_PrdRessource] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_Lmp_PrdRessource] FOREIGN KEY ([CleRessource]) REFERENCES [SA_TMPI].[TrnP_Rsc_Famille] ([CleFamille])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_PrdRessource]
    ON [SA_TMPI].[Lmp_PrdRessource]([CleProduit] ASC);

