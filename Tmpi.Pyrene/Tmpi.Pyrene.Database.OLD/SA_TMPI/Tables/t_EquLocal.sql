CREATE TABLE [SA_TMPI].[t_EquLocal] (
    [CleLocal]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodLocal]      VARCHAR (50)  NOT NULL,
    [LibLocal]      VARCHAR (100) NOT NULL,
    [TxtLocal]      VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_EquLocal_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_EquLocal_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    SMALLINT      NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_EquLocal] PRIMARY KEY CLUSTERED ([CleLocal] ASC),
    CONSTRAINT [UN_t_EquLocal] UNIQUE NONCLUSTERED ([CodLocal] ASC)
);

