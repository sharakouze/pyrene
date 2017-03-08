CREATE TABLE [SA_TMPI].[t_SArt] (
    [ClePerso]    SMALLINT      NOT NULL,
    [CleExercice] TINYINT       NOT NULL,
    [CleImput]    SMALLINT      NOT NULL,
    [CleFourn]    SMALLINT      NULL,
    [CleDomaine]  TINYINT       NOT NULL,
    [CleDevise]   TINYINT       NULL,
    [ValStock]    TINYINT       NULL,
    [IndAchat]    BIT           CONSTRAINT [DF_t_SArt_IndAchat] DEFAULT ((0)) NOT NULL,
    [IndConsom]   BIT           CONSTRAINT [DF_t_SArt_IndConsom] DEFAULT ((0)) NOT NULL,
    [DatDebut]    DATETIME      NULL,
    [DatFin]      DATETIME      NULL,
    [LibNomenc]   VARCHAR (100) NULL,
    [LibMagasin]  VARCHAR (100) NULL,
    [LibFamille]  VARCHAR (100) NULL,
    [LibSFamille] VARCHAR (100) NULL,
    [CleBudget]   SMALLINT      NULL,
    CONSTRAINT [PK_t_SArt] PRIMARY KEY CLUSTERED ([ClePerso] ASC)
);

