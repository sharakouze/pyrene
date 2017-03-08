CREATE TABLE [SA_TMPI].[Usys_LstListe] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CleListe]    SMALLINT      NOT NULL,
    [CodListe]    VARCHAR (50)  NULL,
    [LibListe]    VARCHAR (100) NULL,
    CONSTRAINT [PK_Usys_LstListe] PRIMARY KEY CLUSTERED ([CleListe] ASC, [CleLogiciel] ASC)
);

