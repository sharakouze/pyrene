CREATE TABLE [SA_TMPI].[LmsP_SttChamp] (
    [CleMStats]    SMALLINT NOT NULL,
    [CleChamp]     SMALLINT NULL,
    [ValOperateur] TINYINT  NULL,
    [NumOrdre]     TINYINT  NULL,
    [NumTri]       TINYINT  NULL,
    [TypChamp]     TINYINT  CONSTRAINT [DF_LmsP_SttChamp_TypChamp] DEFAULT ((1)) NOT NULL,
    [CleCommemo]   INT      NULL,
    [CleParametre] INT      NULL,
    [CleSttChamp]  SMALLINT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [UN_LmsP_SttChamp] UNIQUE NONCLUSTERED ([CleMStats] ASC, [CleChamp] ASC, [CleCommemo] ASC, [CleParametre] ASC)
);

