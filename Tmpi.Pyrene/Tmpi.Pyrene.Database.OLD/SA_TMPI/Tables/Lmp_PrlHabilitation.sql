CREATE TABLE [SA_TMPI].[Lmp_PrlHabilitation] (
    [ClePreleveur]    SMALLINT      NOT NULL,
    [CleHabilitation] SMALLINT      NOT NULL,
    [DatDebut]        SMALLDATETIME NOT NULL,
    [DatFin]          SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Lmp_PrlHabilitation] PRIMARY KEY CLUSTERED ([CleHabilitation] ASC, [ClePreleveur] ASC),
    CONSTRAINT [FK1_Lmp_PrlHabilitation] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur]),
    CONSTRAINT [FK2_Lmp_PrlHabilitation] FOREIGN KEY ([CleHabilitation]) REFERENCES [SA_TMPI].[Gen_Trs_Habilit] ([CleHabilit])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_PrlHabilitation]
    ON [SA_TMPI].[Lmp_PrlHabilitation]([CleHabilitation] ASC);

