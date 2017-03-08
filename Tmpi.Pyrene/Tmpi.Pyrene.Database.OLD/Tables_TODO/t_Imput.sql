CREATE TABLE [SA_TMPI].[t_Imput] (
    [CleImput]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodImput]      VARCHAR (50)   NOT NULL,
    [LibImput]      VARCHAR (100)  NOT NULL,
    [TauRecup]      DECIMAL (5, 2) CONSTRAINT [DF_t_Imput_TauRecup] DEFAULT ((0)) NOT NULL,
    [DatSaisie]     DATETIME       CONSTRAINT [DF_t_Imput_DatSaisie] DEFAULT (getdate()) NULL,
    [CleOperateur]  SMALLINT       CONSTRAINT [DF_t_Imput_CleOperateur] DEFAULT ((0)) NULL,
    [NbrModif]      TINYINT        CONSTRAINT [DF_t_Imput_NbrModif] DEFAULT ((0)) NULL,
    [NumVersion]    TINYINT        CONSTRAINT [DF_t_Imput_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   SMALLINT       NULL,
    [TypImput]      TINYINT        CONSTRAINT [DF_t_Imput_TypImput] DEFAULT ((1)) NULL,
    [IndRegroupe]   DECIMAL (1)    NULL,
    [CleRegroupe]   SMALLINT       NULL,
    [CodCompta]     VARCHAR (50)   NULL,
    [CleTVA]        SMALLINT       NULL,
    CONSTRAINT [PK_t_Imput] PRIMARY KEY CLUSTERED ([CleImput] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN1_t_Imput]
    ON [SA_TMPI].[t_Imput]([CodImput] ASC) WITH (FILLFACTOR = 90);

