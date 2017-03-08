CREATE TABLE [SA_TMPI].[Fcp_Tar_Article] (
    [CleArticle]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleArticle_C]  SMALLINT       NULL,
    [CleArticle_H]  SMALLINT       NOT NULL,
    [CodArticle]    VARCHAR (100)  NOT NULL,
    [LibArticle]    VARCHAR (200)  NOT NULL,
    [TxtArticle]    VARCHAR (1000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Fcp_Tar_Article_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Fcp_Tar_Article_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [TypUsage]      TINYINT        NOT NULL,
    [TxtFormule]    VARCHAR (500)  NULL,
    CONSTRAINT [PK_Fcp_Tar_Article] PRIMARY KEY CLUSTERED ([CleArticle] ASC),
    CONSTRAINT [UN_Fcp_Tar_Article] UNIQUE NONCLUSTERED ([CleArticle_H] ASC, [CodArticle] ASC)
);

