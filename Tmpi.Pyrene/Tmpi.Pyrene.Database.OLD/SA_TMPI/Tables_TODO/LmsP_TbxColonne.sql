CREATE TABLE [SA_TMPI].[LmsP_TbxColonne] (
    [CleTbxColonne] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleTable]      SMALLINT      NOT NULL,
    [NumColonne]    SMALLINT      NULL,
    [CodColonne]    VARCHAR (100) NOT NULL,
    [LibColonne]    VARCHAR (200) NULL,
    [EstIndex]      BIT           CONSTRAINT [DF_LmsP_TbxColonne_EstIndex] DEFAULT ((0)) NULL,
    [TypObjet]      TINYINT       NULL,
    [CleObjet]      SMALLINT      NULL,
    [TypDonnee]     TINYINT       NULL,
    CONSTRAINT [PK_LmsP_TbxColonne] PRIMARY KEY CLUSTERED ([CleTbxColonne] ASC),
    CONSTRAINT [FK1_LmsP_TbxColonne] FOREIGN KEY ([CleTable]) REFERENCES [SA_TMPI].[LmsP_TbxTable] ([CleTable]),
    CONSTRAINT [UN_LmsP_TbxColonne] UNIQUE NONCLUSTERED ([CleTable] ASC, [CodColonne] ASC)
);

