CREATE TABLE [SA_TMPI].[Trp_Dem_CodeBarre_Champ] (
    [CleCodeBarre]   SMALLINT      NOT NULL,
    [CleChamp]       SMALLINT      NOT NULL,
    [NbrCarac]       TINYINT       NOT NULL,
    [EstIdentifiant] BIT           NOT NULL,
    [ValIdentifiant] NVARCHAR (50) NULL,
    [NumOrdreChamp]  TINYINT       NOT NULL,
    CONSTRAINT [FK1_Trp_Dem_CodeBarre_Champ] FOREIGN KEY ([CleCodeBarre]) REFERENCES [SA_TMPI].[Trp_Dem_CodeBarre] ([CleCodeBarre]),
    CONSTRAINT [FK2_Trp_Dem_CodeBarre_Champ] FOREIGN KEY ([CleChamp]) REFERENCES [SA_TMPI].[Trp_Dem_CodeBarreChamp] ([CleChamp])
);

