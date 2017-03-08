CREATE TABLE [SA_TMPI].[Lmp_FeuCritere] (
    [CleCritere]    INT           IDENTITY (1, 1) NOT NULL,
    [CleCritere_C]  INT           NULL,
    [CleCritere_H]  INT           NULL,
    [CodCritere]    VARCHAR (50)  NOT NULL,
    [LibCritere]    VARCHAR (100) NOT NULL,
    [TxtCritere]    VARCHAR (255) NULL,
    [IndActif]      TINYINT       NULL,
    [DatModif]      DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Lmp_FeuCritere] PRIMARY KEY CLUSTERED ([CleCritere] ASC),
    CONSTRAINT [UN_Lmp_FeuCritere] UNIQUE NONCLUSTERED ([CleCritere_H] ASC, [CodCritere] ASC)
);

