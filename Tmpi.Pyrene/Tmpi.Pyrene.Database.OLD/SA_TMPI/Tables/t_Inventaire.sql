CREATE TABLE [SA_TMPI].[t_Inventaire] (
    [CleInventaire] INT           IDENTITY (1, 1) NOT NULL,
    [TxtInventaire] VARCHAR (255) NULL,
    [CleMagasin]    TINYINT       NOT NULL,
    [DatValidation] DATETIME      NOT NULL,
    [CleValideur]   SMALLINT      NOT NULL,
    CONSTRAINT [PK_Inventaire] PRIMARY KEY CLUSTERED ([CleInventaire] ASC)
);

