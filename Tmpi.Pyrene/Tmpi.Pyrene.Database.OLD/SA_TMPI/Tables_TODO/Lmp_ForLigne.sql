CREATE TABLE [SA_TMPI].[Lmp_ForLigne] (
    [CleFormule]    SMALLINT      NULL,
    [NumOrdre]      SMALLINT      NULL,
    [TxtCondition]  VARCHAR (255) NULL,
    [TxtRequete]    VARCHAR (255) NULL,
    [DatModif]      SMALLDATETIME NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [FK1_Lmp_ForLigne] FOREIGN KEY ([CleFormule]) REFERENCES [SA_TMPI].[Lmp_ForFormule] ([CleFormule]),
    CONSTRAINT [UN_Lmp_ForLigne] UNIQUE NONCLUSTERED ([CleFormule] ASC, [NumOrdre] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lmp_ForLigne]
    ON [SA_TMPI].[Lmp_ForLigne]([CleFormule] ASC);

