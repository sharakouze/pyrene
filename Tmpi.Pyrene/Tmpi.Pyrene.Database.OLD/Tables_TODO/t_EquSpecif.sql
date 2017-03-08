CREATE TABLE [SA_TMPI].[t_EquSpecif] (
    [CleSpecif]   INT           IDENTITY (1, 1) NOT NULL,
    [NivObjet]    TINYINT       NOT NULL,
    [CleObjet]    INT           NOT NULL,
    [CleCritere]  SMALLINT      NOT NULL,
    [ValCritereA] VARCHAR (255) NULL,
    [ValCritereN] FLOAT (53)    NULL,
    [CleValeur]   INT           NULL,
    [NumOrdre]    TINYINT       NOT NULL,
    CONSTRAINT [PK_t_EquSpecif] PRIMARY KEY CLUSTERED ([CleSpecif] ASC),
    CONSTRAINT [FK1_t_EquSpecif] FOREIGN KEY ([CleCritere]) REFERENCES [SA_TMPI].[t_EquCritere] ([CleCritere]),
    CONSTRAINT [UN_t_EquSpecif] UNIQUE NONCLUSTERED ([CleCritere] ASC, [CleObjet] ASC, [NivObjet] ASC)
);

