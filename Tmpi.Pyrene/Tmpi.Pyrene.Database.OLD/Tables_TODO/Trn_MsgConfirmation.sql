CREATE TABLE [SA_TMPI].[Trn_MsgConfirmation] (
    [CleTache]    INT           NOT NULL,
    [TypMedia]    TINYINT       NOT NULL,
    [DatAEnvoyer] SMALLDATETIME NOT NULL,
    [EstSuspendu] BIT           CONSTRAINT [DF_Trn_MsgConfirmation_EstSuspendu] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Trn_MsgConfirmation] PRIMARY KEY CLUSTERED ([CleTache] ASC)
);

