CREATE TABLE [SA_TMPI].[t_Destock] (
    [CleDestock]    INT      IDENTITY (1, 1) NOT NULL,
    [CleMagasin]    SMALLINT NOT NULL,
    [CleClient]     SMALLINT NOT NULL,
    [CleExercice]   SMALLINT NULL,
    [CleImput]      SMALLINT NULL,
    [IndMagasin]    BIT      CONSTRAINT [DF_t_Destock_IndMagasin] DEFAULT ((0)) NOT NULL,
    [CleFacture]    INT      NULL,
    [CleDevise]     TINYINT  NULL,
    [DatValidation] DATETIME NULL,
    [CleValideur]   SMALLINT NULL,
    CONSTRAINT [PK_t_Destock] PRIMARY KEY CLUSTERED ([CleDestock] ASC),
    CONSTRAINT [FK1_t_Destock] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK9_t_Destock] FOREIGN KEY ([CleImput]) REFERENCES [SA_TMPI].[t_BudAffect] ([CleAffect])
);

