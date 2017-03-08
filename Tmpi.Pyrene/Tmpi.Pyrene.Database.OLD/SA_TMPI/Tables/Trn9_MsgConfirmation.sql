CREATE TABLE [SA_TMPI].[Trn9_MsgConfirmation] (
    [NumEnvoi]    INT           NOT NULL,
    [CleTache]    INT           NOT NULL,
    [TypMedia]    TINYINT       NOT NULL,
    [DatAEnvoyer] SMALLDATETIME NOT NULL,
    [DatEnvoi]    SMALLDATETIME NOT NULL,
    [CleEnvoyeur] INT           NOT NULL,
    CONSTRAINT [PK_Trn9_MsgConfirmation] PRIMARY KEY CLUSTERED ([CleTache] ASC, [NumEnvoi] ASC)
);

