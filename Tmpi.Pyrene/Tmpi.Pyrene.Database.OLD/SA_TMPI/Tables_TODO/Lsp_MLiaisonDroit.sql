CREATE TABLE [SA_TMPI].[Lsp_MLiaisonDroit] (
    [CleMliaison]  SMALLINT NOT NULL,
    [CleOperateur] SMALLINT NOT NULL,
    [IndModif]     BIT      CONSTRAINT [DF_Lsp_MLiaisonDroit_IndModif] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [UN_Lsp_MLiaisonDroit] UNIQUE NONCLUSTERED ([CleMliaison] ASC, [CleOperateur] ASC)
);

