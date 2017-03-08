CREATE TABLE [SA_TMPI].[Fct_PaiPaiement] (
    [ClePaiement]     INT             IDENTITY (1, 1) NOT NULL,
    [NumPaiement]     VARCHAR (25)    NULL,
    [ClePayeur]       INT             NOT NULL,
    [DatPaiement]     SMALLDATETIME   NOT NULL,
    [MntPaiement]     DECIMAL (10, 2) NOT NULL,
    [TypPaiement]     TINYINT         NOT NULL,
    [RefPaiement]     VARCHAR (25)    NULL,
    [CleOperateur]    INT             NULL,
    [EstMultiFacture] BIT             CONSTRAINT [DF_Fct_PaiPaiement_EstMultiFacture] DEFAULT ((0)) NOT NULL,
    [TxtPaiement]     VARCHAR (2000)  NULL,
    [CleOrigine]      TINYINT         NULL,
    [CleExterne]      INT             NULL,
    CONSTRAINT [PK_Fct_PaiPaiement] PRIMARY KEY CLUSTERED ([ClePaiement] ASC),
    CONSTRAINT [FK1_Fct_PaiPaiement] FOREIGN KEY ([ClePayeur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [UN_Fct_PaiPaiement] UNIQUE NONCLUSTERED ([NumPaiement] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID2_Fct_PaiPaiement]
    ON [SA_TMPI].[Fct_PaiPaiement]([ClePayeur] ASC);

