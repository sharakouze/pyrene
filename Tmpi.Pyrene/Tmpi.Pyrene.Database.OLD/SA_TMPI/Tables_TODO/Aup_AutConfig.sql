CREATE TABLE [SA_TMPI].[Aup_AutConfig] (
    [CleAutConfig] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [TypAutomate]  TINYINT       NOT NULL,
    [CodPropriete] VARCHAR (50)  NOT NULL,
    [TxtPropriete] VARCHAR (255) NULL,
    CONSTRAINT [PK_Aup_AutConfig] PRIMARY KEY CLUSTERED ([CleAutConfig] ASC)
);

