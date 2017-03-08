CREATE TABLE [SA_TMPI].[t_EquAtelier] (
    [CleAtelier]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodAtelier]    VARCHAR (50)  NOT NULL,
    [LibAtelier]    VARCHAR (100) NOT NULL,
    [TxtAtelier]    VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_EquAtelier_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  INT           CONSTRAINT [DF_t_EquAtelier_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   INT           NULL,
    [_EstRepris]    BIT           NULL,
    CONSTRAINT [PK_t_EquAtelier] PRIMARY KEY CLUSTERED ([CleAtelier] ASC),
    CONSTRAINT [UN_t_EquAtelier] UNIQUE NONCLUSTERED ([CodAtelier] ASC)
);

