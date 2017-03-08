CREATE TABLE [SA_TMPI].[Doc_DocFichier] (
    [CleDocument] INT   NOT NULL,
    [BinFichier]  IMAGE NOT NULL,
    CONSTRAINT [FK1_Doc_DocFichier] FOREIGN KEY ([CleDocument]) REFERENCES [SA_TMPI].[Doc_DocDocument] ([CleDocument])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Doc_DocFichier]
    ON [SA_TMPI].[Doc_DocFichier]([CleDocument] ASC);

