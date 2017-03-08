CREATE TABLE [SA_TMPI].[Gen_Prf_Fonction] (
    [CleLogiciel]   TINYINT       NOT NULL,
    [CleFonction]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFonction]   VARCHAR (50)  NOT NULL,
    [LibFonction]   VARCHAR (100) NOT NULL,
    [TxtFonction]   VARCHAR (255) NULL,
    [DatSaisie]     SMALLDATETIME CONSTRAINT [DF_Gen_Prf_Fonction_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  SMALLINT      CONSTRAINT [DF_Gen_Prf_Fonction_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       CONSTRAINT [DF_Gen_Prf_Fonction_NumVersion] DEFAULT ((0)) NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gen_Prf_Fonction] PRIMARY KEY CLUSTERED ([CleFonction] ASC),
    CONSTRAINT [UN_Gen_Prf_Fonction] UNIQUE NONCLUSTERED ([CleLogiciel] ASC, [CodFonction] ASC)
);

