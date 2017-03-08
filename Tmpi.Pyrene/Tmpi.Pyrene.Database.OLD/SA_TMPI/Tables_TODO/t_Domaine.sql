CREATE TABLE [SA_TMPI].[t_Domaine] (
    [CleDomaine]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodDomaine]    VARCHAR (50)  NOT NULL,
    [LibDomaine]    VARCHAR (100) NOT NULL,
    [TxtDomaine]    VARCHAR (255) NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_Domaine_DatSaisie] DEFAULT (getdate()) NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_t_Domaine_CleOperateur] DEFAULT ((0)) NULL,
    [NumVersion]    TINYINT       CONSTRAINT [DF_t_Domaine_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_t_Domaine] PRIMARY KEY CLUSTERED ([CleDomaine] ASC),
    CONSTRAINT [UN_t_Domaine] UNIQUE NONCLUSTERED ([CodDomaine] ASC)
);

