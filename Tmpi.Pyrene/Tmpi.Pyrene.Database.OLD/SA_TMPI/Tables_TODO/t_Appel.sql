CREATE TABLE [SA_TMPI].[t_Appel] (
    [CleExercice]   SMALLINT      NOT NULL,
    [CleAppel]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodAppel]      VARCHAR (50)  NOT NULL,
    [TxtAppel]      VARCHAR (255) NULL,
    [CleDomaine]    SMALLINT      NOT NULL,
    [CleAcheteur]   SMALLINT      NOT NULL,
    [DatCreation]   DATETIME      NULL,
    [ValStock]      TINYINT       NULL,
    [LibMagasin]    VARCHAR (100) NULL,
    [LibFamille]    VARCHAR (100) NULL,
    [CleECommande]  INT           NULL,
    [NivSaisie]     TINYINT       CONSTRAINT [DF_t_Appel_NivSaisie] DEFAULT ((0)) NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_Appel] PRIMARY KEY CLUSTERED ([CleAppel] ASC),
    CONSTRAINT [FK1_t_Appel] FOREIGN KEY ([CleExercice]) REFERENCES [SA_TMPI].[Gen_DivExercice] ([CleExercice]),
    CONSTRAINT [FK2_t_Appel] FOREIGN KEY ([CleDomaine]) REFERENCES [SA_TMPI].[t_Domaine] ([CleDomaine]),
    CONSTRAINT [UN_t_Appel] UNIQUE NONCLUSTERED ([CleDomaine] ASC, [CodAppel] ASC)
);

