CREATE TABLE [SA_TMPI].[Trp_SecSecteurG] (
    [CleSecteur]  SMALLINT NOT NULL,
    [CleSecteurG] SMALLINT NOT NULL,
    CONSTRAINT [PK_Trp_SecSecteurG] PRIMARY KEY CLUSTERED ([CleSecteur] ASC, [CleSecteurG] ASC),
    CONSTRAINT [FK1_Trp_SecSecteurG] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Trp_SecSecteurG] FOREIGN KEY ([CleSecteurG]) REFERENCES [SA_TMPI].[Trp_Pnt_SecteurG] ([CleSecteurG])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trp_SecSecteurG]
    ON [SA_TMPI].[Trp_SecSecteurG]([CleSecteur] ASC);

