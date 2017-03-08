CREATE TABLE [SA_TMPI].[t_LotDetail] (
    [CleLot]        INT             NOT NULL,
    [NumOrdre]      SMALLINT        NULL,
    [DatDestockage] DATETIME        NOT NULL,
    [DatOuverture]  DATETIME        NULL,
    [DatCloture]    DATETIME        NULL,
    [DatPeremption] DATETIME        NULL,
    [CleLocal]      SMALLINT        NULL,
    [QteInit]       DECIMAL (15, 3) NOT NULL,
    [QteReste]      DECIMAL (15, 3) NOT NULL,
    [TxtLotDetail]  VARCHAR (255)   NULL,
    [CleOperateur]  SMALLINT        NOT NULL,
    [DatSaisie]     DATETIME        NOT NULL,
    [CleValideur]   SMALLINT        NULL,
    [DatValidation] DATETIME        NULL,
    [CleLotDetail]  INT             IDENTITY (1, 1) NOT NULL
);

