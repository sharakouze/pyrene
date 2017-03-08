CREATE TABLE [SA_TMPI].[t_AppelFourn] (
    [CleAppel] SMALLINT NOT NULL,
    [CleFourn] SMALLINT NOT NULL,
    CONSTRAINT [PK_t_AppelFourn] PRIMARY KEY CLUSTERED ([CleAppel] ASC, [CleFourn] ASC),
    CONSTRAINT [FK1_t_AppelFourn] FOREIGN KEY ([CleAppel]) REFERENCES [SA_TMPI].[t_Appel] ([CleAppel]),
    CONSTRAINT [FK2_t_AppelFourn] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

