CREATE TABLE [SA_TMPI].[Lmp_CbrChamp] (
    [CleCode]        SMALLINT       NOT NULL,
    [CleChamp]       SMALLINT       NOT NULL,
    [CodChamp]       NVARCHAR (50)  NOT NULL,
    [LibChamp]       NVARCHAR (100) NOT NULL,
    [NbrCarac]       TINYINT        NOT NULL,
    [EstIdentifiant] BIT            NOT NULL,
    [ValIdentifiant] NVARCHAR (50)  NULL,
    [NumOrdreChamp]  TINYINT        NOT NULL,
    CONSTRAINT [FK1_Lmp_CbrChamp] FOREIGN KEY ([CleCode]) REFERENCES [SA_TMPI].[Lmp_CbrCode] ([CleCode])
);

