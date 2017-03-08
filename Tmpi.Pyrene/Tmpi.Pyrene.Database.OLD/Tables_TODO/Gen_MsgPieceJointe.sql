CREATE TABLE [SA_TMPI].[Gen_MsgPieceJointe] (
    [CleMessage]     INT           NOT NULL,
    [RepPieceJointe] VARCHAR (255) NULL,
    [NomPieceJointe] VARCHAR (255) NOT NULL,
    [NumPieceJointe] VARCHAR (50)  NULL
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_MsgPieceJointe]
    ON [SA_TMPI].[Gen_MsgPieceJointe]([CleMessage] ASC);

