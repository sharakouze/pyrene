CREATE TABLE [SA_TMPI].[Lmp_MetParametre] (
    [CleMethode]        SMALLINT        NOT NULL,
    [CleParametre]      INT             NOT NULL,
    [ValDetection]      DECIMAL (15, 5) NULL,
    [ValQuantification] DECIMAL (15, 5) NULL,
    [ValReglementaire]  DECIMAL (15, 5) NULL,
    [PrcIncertitude]    DECIMAL (5, 2)  CONSTRAINT [DF_Lmp_MetParametre_PrcIncertitude] DEFAULT ((0)) NULL,
    [ValCCalpha]        DECIMAL (15, 5) NULL,
    [ValCCbeta]         DECIMAL (15, 5) NULL,
    [ValGamma]          DECIMAL (18)    NULL,
    [ValQuantifMin]     DECIMAL (10, 3) NULL,
    [ValDecisionMax]    DECIMAL (10, 3) NULL,
    [ValIncertitude]    DECIMAL (5, 2)  NULL,
    [CleMatrice]        SMALLINT        NULL,
    CONSTRAINT [FK1_Lmp_MetParametre] FOREIGN KEY ([CleMethode]) REFERENCES [SA_TMPI].[Lmp_MetMethode] ([CleMethode]),
    CONSTRAINT [FK2_Lmp_MetParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_MetParametre]
    ON [SA_TMPI].[Lmp_MetParametre]([CleMethode] ASC, [CleParametre] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Lmp_MetParametre]
    ON [SA_TMPI].[Lmp_MetParametre]([CleMethode] ASC, [CleParametre] ASC, [CleMatrice] ASC);

