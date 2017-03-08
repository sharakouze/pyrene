CREATE TABLE [SA_TMPI].[Usr_AccGestionnaire] (
    [CleListe]        SMALLINT NOT NULL,
    [CleGestionnaire] SMALLINT NOT NULL,
    CONSTRAINT [PK_Usr_ACCGestionnaire] PRIMARY KEY CLUSTERED ([CleListe] ASC, [CleGestionnaire] ASC),
    CONSTRAINT [FK1_Usr_ACCGestionnaire] FOREIGN KEY ([CleListe]) REFERENCES [SA_TMPI].[Usr_Acc_Liste] ([CleListe])
);

