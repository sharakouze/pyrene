CREATE TABLE [SA_TMPI].[EdiP_ExpChamp] (
    [CleExpChamp]     INT           IDENTITY (1, 1) NOT NULL,
    [CleExpTransfert] INT           NOT NULL,
    [NumOrdre]        TINYINT       NOT NULL,
    [CodChamp]        VARCHAR (50)  NOT NULL,
    [LibChamp]        VARCHAR (100) NOT NULL,
    [TypFormat]       TINYINT       NOT NULL,
    [ValTaille]       SMALLINT      NULL,
    [CleObjet]        SMALLINT      NULL,
    [CleCommemo]      SMALLINT      NULL,
    [ValConstante]    VARCHAR (255) NULL,
    [EstClef]         BIT           NOT NULL,
    CONSTRAINT [PK_EdiP_ExpChamp] PRIMARY KEY CLUSTERED ([CleExpChamp] ASC),
    CONSTRAINT [FK1_EdiP_ExpChamp] FOREIGN KEY ([CleExpTransfert]) REFERENCES [SA_TMPI].[EdiP_ExpTransfert] ([CleExpTransfert])
);

