CREATE TABLE [SA_TMPI].[Usys_Edi_ExpObjet] (
    [CleObjet]  SMALLINT      NOT NULL,
    [CodObjet]  VARCHAR (50)  NOT NULL,
    [LibObjet]  VARCHAR (100) NOT NULL,
    [TypSource] TINYINT       NOT NULL,
    [NomChamp]  VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Usys_ExpObjet] PRIMARY KEY CLUSTERED ([CleObjet] ASC)
);

