CREATE TABLE [SA_TMPI].[LmsP_MdtMandat] (
    [CleSociete]    SMALLINT       NULL,
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    [CleMandat]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleMandat_C]   SMALLINT       NULL,
    [CleMandat_H]   SMALLINT       NOT NULL,
    [CodMandat]     VARCHAR (100)  NOT NULL,
    [LibMandat]     VARCHAR (200)  NOT NULL,
    [TxtMandat]     VARCHAR (2000) NULL,
    [TypMandat]     TINYINT        CONSTRAINT [DF_LmsP_MdtMandat_TypMandat] DEFAULT ((1)) NOT NULL,
    [NbrSignature]  TINYINT        CONSTRAINT [DF_LmsP_MdtMandat_NbrSignature] DEFAULT ((1)) NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_LmsP_MdtMandat_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_LmsP_MdtMandat_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_LmsP_MdtMandat_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_LmsP_MdtMandat] PRIMARY KEY CLUSTERED ([CleMandat] ASC),
    CONSTRAINT [UN_LmsP_MdtMandat] UNIQUE NONCLUSTERED ([CodMandat] ASC)
);

