CREATE TABLE [SA_TMPI].[t_MO] (
    [CleMO]         SMALLINT        IDENTITY (1, 1) NOT NULL,
    [CodMO]         VARCHAR (50)    NOT NULL,
    [LibMO]         VARCHAR (100)   NOT NULL,
    [TxtMO]         VARCHAR (255)   NULL,
    [PrxUnitaire]   DECIMAL (15, 4) CONSTRAINT [DF_t_MO_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [CleDevise]     TINYINT         NOT NULL,
    [DatSaisie]     DATETIME        NULL,
    [CleOperateur]  SMALLINT        NULL,
    [NbrModif]      TINYINT         NULL,
    [NumVersion]    TINYINT         NULL,
    [DatValidation] DATETIME        NULL,
    [CleValideur]   SMALLINT        NULL,
    CONSTRAINT [PK_MO] PRIMARY KEY CLUSTERED ([CleMO] ASC),
    CONSTRAINT [UN_Mo] UNIQUE NONCLUSTERED ([CodMO] ASC)
);

