CREATE TABLE [SA_TMPI].[Fct_DevPrelevement] (
    [CleDevis]       INT      NOT NULL,
    [ClePrelevement] INT      IDENTITY (1, 1) NOT NULL,
    [NumOrdre]       SMALLINT NOT NULL,
    [NbrPrelevement] SMALLINT NOT NULL,
    [CleClasse]      INT      NULL,
    [CleFamille]     INT      NULL,
    [CleMatrice]     INT      NULL,
    [CleProduit]     INT      NULL,
    CONSTRAINT [PK_Fct_DevPrelevement] PRIMARY KEY CLUSTERED ([ClePrelevement] ASC)
);

