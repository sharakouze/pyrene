CREATE TABLE [SA_TMPI].[Gen_FouRib] (
    [CleRib]     INT           IDENTITY (1, 1) NOT NULL,
    [CleFourn]   SMALLINT      NOT NULL,
    [LibBanque]  VARCHAR (100) NULL,
    [RibBanque]  VARCHAR (10)  NULL,
    [RibGuichet] VARCHAR (10)  NULL,
    [RibCompte]  VARCHAR (11)  NULL,
    [RibCle]     VARCHAR (10)  NULL,
    [EstDefaut]  BIT           NOT NULL,
    CONSTRAINT [PK_Gen_FouRib] PRIMARY KEY CLUSTERED ([CleRib] ASC),
    CONSTRAINT [FK1_Gen_FouRib] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

