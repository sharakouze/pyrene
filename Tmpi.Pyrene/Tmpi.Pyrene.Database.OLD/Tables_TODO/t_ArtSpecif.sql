CREATE TABLE [SA_TMPI].[t_ArtSpecif] (
    [CleSpecif]   INT           IDENTITY (1, 1) NOT NULL,
    [NivObjet]    TINYINT       NOT NULL,
    [CleObjet]    INT           NOT NULL,
    [CleCritere]  SMALLINT      NOT NULL,
    [ValCritereA] VARCHAR (255) NULL,
    [ValCritereN] FLOAT (53)    NULL,
    [CleValeur]   INT           NULL,
    [NumOrdre]    TINYINT       NOT NULL,
    CONSTRAINT [PK_t_ArtSpecif] PRIMARY KEY CLUSTERED ([CleSpecif] ASC),
    CONSTRAINT [FK1_t_ArtSpecif] FOREIGN KEY ([CleCritere]) REFERENCES [SA_TMPI].[t_ArtCritere] ([CleCritere]),
    CONSTRAINT [UN_t_ArtSpecif] UNIQUE NONCLUSTERED ([CleCritere] ASC, [CleObjet] ASC, [NivObjet] ASC)
);

