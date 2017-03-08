CREATE TABLE [SA_TMPI].[Usr_LogEvenement] (
    [CleEvenement] INT           IDENTITY (1, 1) NOT NULL,
    [CleOperateur] SMALLINT      NOT NULL,
    [CleLogiciel]  TINYINT       NOT NULL,
    [CleTable]     SMALLINT      NULL,
    [CleObjet]     INT           NULL,
    [TxtObjet]     VARCHAR (255) NULL,
    [TypEvenement] TINYINT       NOT NULL,
    [DatEvenement] SMALLDATETIME CONSTRAINT [DF_Usr_LogEvenement_DatEvenement] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Usr_LogEvenement] PRIMARY KEY CLUSTERED ([CleEvenement] ASC)
);

