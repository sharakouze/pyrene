CREATE TABLE [SA_TMPI].[GenP_MdtMandat] (
    [CleLogiciel]   TINYINT        NOT NULL,
    [CleMandat]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleMandat_C]   SMALLINT       NULL,
    [CleMandat_H]   SMALLINT       NOT NULL,
    [TypMandat]     TINYINT        NOT NULL,
    [NivMandat]     TINYINT        CONSTRAINT [DF_GenP_MdtMandat_NivMandat] DEFAULT ((1)) NOT NULL,
    [CodMandat]     VARCHAR (100)  NOT NULL,
    [LibMandat]     VARCHAR (200)  NOT NULL,
    [TxtMandat]     VARCHAR (4000) NULL,
    [TxtMessage]    VARCHAR (4000) NULL,
    [NbrSignature]  TINYINT        CONSTRAINT [DF_GenP_MdtMandat_NbrSignature] DEFAULT ((1)) NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_GenP_MdtMandat_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_GenP_MdtMandat_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_GenP_MdtMandat_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_GenP_MdtMandat] PRIMARY KEY CLUSTERED ([CleMandat] ASC),
    CONSTRAINT [UN1_GenP_MdtMandat] UNIQUE NONCLUSTERED ([TypMandat] ASC, [CodMandat] ASC),
    CONSTRAINT [UN2_GenP_MdtMandat] UNIQUE NONCLUSTERED ([NivMandat] ASC, [CodMandat] ASC)
);

