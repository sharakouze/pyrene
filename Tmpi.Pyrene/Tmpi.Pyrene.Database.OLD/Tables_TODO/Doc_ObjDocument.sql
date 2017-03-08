CREATE TABLE [SA_TMPI].[Doc_ObjDocument] (
    [CleObjet]    INT     NOT NULL,
    [TypObjet]    TINYINT NOT NULL,
    [CleDocument] INT     NOT NULL,
    CONSTRAINT [PK_Doc_ObjDocument] PRIMARY KEY CLUSTERED ([CleObjet] ASC, [TypObjet] ASC, [CleDocument] ASC),
    CONSTRAINT [FK1_Doc_ObjDocument] FOREIGN KEY ([CleDocument]) REFERENCES [SA_TMPI].[Doc_DocDocument] ([CleDocument])
);

