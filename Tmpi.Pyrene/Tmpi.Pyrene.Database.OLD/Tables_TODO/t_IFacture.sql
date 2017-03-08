CREATE TABLE [SA_TMPI].[t_IFacture] (
    [CleExercice] SMALLINT        NOT NULL,
    [CleIFacture] INT             IDENTITY (1, 1) NOT NULL,
    [NumFacture]  VARCHAR (25)    NOT NULL,
    [DatFacture]  DATETIME        NULL,
    [CleFourn]    SMALLINT        NOT NULL,
    [CleClient]   SMALLINT        NOT NULL,
    [CleImput]    SMALLINT        NOT NULL,
    [CleDevise]   SMALLINT        NULL,
    [MntHT]       DECIMAL (15, 2) CONSTRAINT [DF_t_IFacture_MntHT] DEFAULT ((0)) NOT NULL,
    [MntTVA]      DECIMAL (15, 2) CONSTRAINT [DF_t_IFacture_MntTVA] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_IFacture] PRIMARY KEY CLUSTERED ([CleIFacture] ASC),
    CONSTRAINT [FK1_t_IFacture] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_t_IFacture] FOREIGN KEY ([CleClient]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_t_IFacture] FOREIGN KEY ([CleExercice]) REFERENCES [SA_TMPI].[Gen_DivExercice] ([CleExercice]),
    CONSTRAINT [UN_t_IFacture] UNIQUE NONCLUSTERED ([NumFacture] ASC)
);

