CREATE TABLE [SA_TMPI].[Lmp_PrlSecteurG] (
    [ClePreleveur] SMALLINT NOT NULL,
    [CleSecteurG]  SMALLINT NOT NULL,
    [NivPriorite]  TINYINT  NOT NULL,
    CONSTRAINT [FK1_Lmp_PrlSecteurG] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur]),
    CONSTRAINT [FK2_Lmp_PrlSecteurG] FOREIGN KEY ([CleSecteurG]) REFERENCES [SA_TMPI].[Trp_Pnt_SecteurG] ([CleSecteurG])
);

