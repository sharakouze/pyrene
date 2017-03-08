CREATE TABLE [SA_TMPI].[t_EFactureBord] (
    [CleExercice]     TINYINT         NOT NULL,
    [CleEFactureBord] INT             IDENTITY (1, 1) NOT NULL,
    [NumBordereau]    VARCHAR (25)    NOT NULL,
    [TxtBordereau]    VARCHAR (255)   NULL,
    [DatEnvoi]        DATETIME        NOT NULL,
    [DatValidation]   DATETIME        NOT NULL,
    [CleValideur]     SMALLINT        NOT NULL,
    [MntTotal]        DECIMAL (15, 2) NULL,
    CONSTRAINT [PK_EFactureBord] PRIMARY KEY CLUSTERED ([CleEFactureBord] ASC),
    CONSTRAINT [UN_EFactureBord] UNIQUE NONCLUSTERED ([CleExercice] ASC, [NumBordereau] ASC)
);

