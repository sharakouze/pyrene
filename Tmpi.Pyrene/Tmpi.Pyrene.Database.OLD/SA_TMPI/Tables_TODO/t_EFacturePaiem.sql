CREATE TABLE [SA_TMPI].[t_EFacturePaiem] (
    [CleExercice]      TINYINT         NOT NULL,
    [CleEFacturePaiem] INT             IDENTITY (1, 1) NOT NULL,
    [NumPaiement]      VARCHAR (25)    NOT NULL,
    [TxtPaiement]      VARCHAR (500)   NULL,
    [DatPaiement]      DATETIME        NOT NULL,
    [DatValidation]    DATETIME        NOT NULL,
    [CleValideur]      SMALLINT        NOT NULL,
    [MntPaiement]      DECIMAL (15, 2) NULL,
    [CleFourn]         SMALLINT        NULL,
    [TypPaiement]      TINYINT         NULL,
    [CleMarche]        SMALLINT        NULL,
    [TxtReference]     VARCHAR (500)   NULL,
    CONSTRAINT [PK_EFacturePaiem] PRIMARY KEY CLUSTERED ([CleEFacturePaiem] ASC),
    CONSTRAINT [UN_EFacturePaiem] UNIQUE NONCLUSTERED ([CleExercice] ASC, [NumPaiement] ASC)
);

