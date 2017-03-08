CREATE TABLE [SA_TMPI].[t_EquCritere] (
    [CleCritere]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodCritere]    VARCHAR (50)  NOT NULL,
    [LibCritere]    VARCHAR (100) NOT NULL,
    [TxtCritere]    VARCHAR (255) NULL,
    [TypFormat]     TINYINT       NOT NULL,
    [TypCaract]     TINYINT       NOT NULL,
    [IndOblig]      BIT           NOT NULL,
    [CleListe]      SMALLINT      NULL,
    [DatSaisie]     DATETIME      NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquCritere] PRIMARY KEY CLUSTERED ([CleCritere] ASC),
    CONSTRAINT [UN_t_EquCritere] UNIQUE NONCLUSTERED ([CodCritere] ASC)
);

