CREATE TABLE [SA_TMPI].[t_EquContrat] (
    [CleContrat]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [NumContrat]    VARCHAR (25)  NULL,
    [LibContrat]    VARCHAR (100) NOT NULL,
    [TxtContrat]    VARCHAR (255) NULL,
    [CleFourn]      SMALLINT      NOT NULL,
    [CleClient]     SMALLINT      NOT NULL,
    [DatDebut]      DATETIME      NULL,
    [DatFin]        DATETIME      NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquContrat] PRIMARY KEY CLUSTERED ([CleContrat] ASC),
    CONSTRAINT [FK1_T_EQUCONTRAT] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

