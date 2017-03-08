CREATE TABLE [SA_TMPI].[Gen_PrfFonction] (
    [ClePersonneProfil] INT      NOT NULL,
    [CleFonction]       SMALLINT NOT NULL,
    CONSTRAINT [PK_Gen_PrfFonction] PRIMARY KEY CLUSTERED ([CleFonction] ASC, [ClePersonneProfil] ASC),
    CONSTRAINT [FK1_Gen_PrfFonction] FOREIGN KEY ([ClePersonneProfil]) REFERENCES [SA_TMPI].[Gen_SocPersonneProfil] ([ClePersonneProfil]),
    CONSTRAINT [FK2_Gen_PrfFonction] FOREIGN KEY ([CleFonction]) REFERENCES [SA_TMPI].[Gen_Prf_Fonction] ([CleFonction])
);

