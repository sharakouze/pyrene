CREATE TABLE [SA_TMPI].[LmsP_ParCttContrainte] (
    [CleParametre]     INT           NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [CleParContrainte] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleContrainte]    SMALLINT      NULL,
    [DatExpiration]    SMALLDATETIME NULL,
    [LstValeur]        VARCHAR (500) NULL,
    CONSTRAINT [PK_LmsP_ParCttContrainte] PRIMARY KEY CLUSTERED ([CleParContrainte] ASC),
    CONSTRAINT [FK1_LmsP_ParCttContrainte] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK2_LmsP_ParCttContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [UN_LmsP_ParCttContrainte] UNIQUE NONCLUSTERED ([CleParametre] ASC, [TypContrainte] ASC, [CleContrainte] ASC)
);

