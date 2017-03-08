CREATE TABLE [SA_TMPI].[USys_Lms_DosAction] (
    [CleAction] SMALLINT      NOT NULL,
    [CodObjet]  VARCHAR (50)  NOT NULL,
    [CodAction] VARCHAR (50)  NOT NULL,
    [TxtAction] VARCHAR (200) NOT NULL,
    [NumOrdre]  SMALLINT      NOT NULL,
    [CleMenu]   SMALLINT      NOT NULL,
    CONSTRAINT [PK_USys_Lms_DosAction] PRIMARY KEY CLUSTERED ([CleAction] ASC)
);

