CREATE TABLE [SA_TMPI].[Gen_SocDevisDocument] (
    [CleDocument] INT   IDENTITY (1, 1) NOT NULL,
    [CleDevis]    INT   NOT NULL,
    [ImgDocument] IMAGE NOT NULL,
    CONSTRAINT [PK_Gen_SocDevisDocument] PRIMARY KEY CLUSTERED ([CleDocument] ASC)
);

