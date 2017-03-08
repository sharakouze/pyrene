CREATE TABLE [SA_TMPI].[Trn_PntPhoto] (
    [ClePhoto] INT         IDENTITY (1, 1) NOT NULL,
    [ClePoint] INT         NOT NULL,
    [ImgPoint] IMAGE       NOT NULL,
    [TypImage] VARCHAR (4) NOT NULL,
    CONSTRAINT [PK_TrnP_PntPhoto] PRIMARY KEY CLUSTERED ([ClePhoto] ASC),
    CONSTRAINT [FK1_TrnP_PntPhoto] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntPhoto]
    ON [SA_TMPI].[Trn_PntPhoto]([ClePhoto] ASC);

