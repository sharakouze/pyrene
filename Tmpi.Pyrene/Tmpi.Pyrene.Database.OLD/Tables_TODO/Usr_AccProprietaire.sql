CREATE TABLE [SA_TMPI].[Usr_AccProprietaire] (
    [CleListe]        SMALLINT NOT NULL,
    [CleProprietaire] SMALLINT NOT NULL,
    CONSTRAINT [PK_Usr_ACCProprietaire] PRIMARY KEY CLUSTERED ([CleListe] ASC, [CleProprietaire] ASC),
    CONSTRAINT [FK1_Usr_ACCProprietaire] FOREIGN KEY ([CleListe]) REFERENCES [SA_TMPI].[Usr_Acc_Liste] ([CleListe])
);

