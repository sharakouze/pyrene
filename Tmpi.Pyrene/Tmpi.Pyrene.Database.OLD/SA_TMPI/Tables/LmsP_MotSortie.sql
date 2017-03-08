CREATE TABLE [SA_TMPI].[LmsP_MotSortie] (
    [CleMotSortie]    INT      IDENTITY (1, 1) NOT NULL,
    [CleMotif]        SMALLINT NOT NULL,
    [CleEtat]         SMALLINT NULL,
    [CleExport]       SMALLINT NULL,
    [CleDestinataire] INT      NULL,
    [NbrExemplaire]   TINYINT  CONSTRAINT [DF_LmsP_MotSortie_NbrExemplaire] DEFAULT ((1)) NOT NULL,
    [TypTiers]        TINYINT  NULL,
    [CleMFeuille]     SMALLINT NULL,
    CONSTRAINT [PK_LmsP_MotSortie] PRIMARY KEY CLUSTERED ([CleMotSortie] ASC),
    CONSTRAINT [FK1_LmsP_MotSortie] FOREIGN KEY ([CleMotif]) REFERENCES [SA_TMPI].[Lmp_MotMotif] ([CleMotif]),
    CONSTRAINT [FK2_LmsP_MotSortie] FOREIGN KEY ([CleEtat]) REFERENCES [SA_TMPI].[Lmp_SrtEtat] ([CleEtat]),
    CONSTRAINT [FK3_LmsP_MotSortie] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport]),
    CONSTRAINT [UN_LmsP_MotSortie] UNIQUE NONCLUSTERED ([CleMotif] ASC, [CleMFeuille] ASC, [CleEtat] ASC, [CleExport] ASC, [TypTiers] ASC, [CleDestinataire] ASC)
);

