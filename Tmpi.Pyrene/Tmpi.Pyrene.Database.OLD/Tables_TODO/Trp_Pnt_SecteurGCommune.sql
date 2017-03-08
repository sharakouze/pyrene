CREATE TABLE [SA_TMPI].[Trp_Pnt_SecteurGCommune] (
    [CleSecteurG] SMALLINT NOT NULL,
    [CleCommune]  INT      NOT NULL,
    CONSTRAINT [PK_Trn_Pnt_SecGCommune] PRIMARY KEY CLUSTERED ([CleCommune] ASC, [CleSecteurG] ASC),
    CONSTRAINT [FK1_Trn_Pnt_SecGCommune] FOREIGN KEY ([CleSecteurG]) REFERENCES [SA_TMPI].[Trp_Pnt_SecteurG] ([CleSecteurG]),
    CONSTRAINT [FK2_Trn_Pnt_SecGCommune] FOREIGN KEY ([CleCommune]) REFERENCES [SA_TMPI].[Gen_Commune] ([CleCommune])
);

