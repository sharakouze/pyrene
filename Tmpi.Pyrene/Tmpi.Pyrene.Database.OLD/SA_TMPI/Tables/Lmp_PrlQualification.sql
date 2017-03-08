CREATE TABLE [SA_TMPI].[Lmp_PrlQualification] (
    [ClePreleveur]     SMALLINT NOT NULL,
    [CleQualification] SMALLINT NOT NULL,
    CONSTRAINT [PK_Lmp_PrlQualification] PRIMARY KEY CLUSTERED ([ClePreleveur] ASC, [CleQualification] ASC),
    CONSTRAINT [FK1_Lmp_PrlQualification] FOREIGN KEY ([ClePreleveur]) REFERENCES [SA_TMPI].[Lmp_PrlPreleveur] ([ClePreleveur]),
    CONSTRAINT [FK2_Lmp_PrlQualification] FOREIGN KEY ([CleQualification]) REFERENCES [SA_TMPI].[Gen_Soc_Qualif] ([CleQualif])
);

