CREATE TABLE [SA_TMPI].[Lsn_MLsnMLiaison] (
    [CleMLiaison]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodMLiaison]    VARCHAR (50)  NOT NULL,
    [LibMLiaison]    VARCHAR (100) NULL,
    [TxtMLiaison]    VARCHAR (255) NULL,
    [CleDeclenc]     INT           NULL,
    [CleLogiciel]    TINYINT       NULL,
    [CleTable]       SMALLINT      NULL,
    [IndCommun]      BIT           CONSTRAINT [DF_Lsn_MLsnMLiaison_IndCommun] DEFAULT ((0)) NOT NULL,
    [CleProprio]     SMALLINT      NOT NULL,
    [DatModif]       DATETIME      NOT NULL,
    [CleOperateur]   SMALLINT      NOT NULL,
    [DatValidation]  DATETIME      NULL,
    [CleValideur]    SMALLINT      NULL,
    [EstAutomatique] BIT           CONSTRAINT [DF_Lsn_MLsnMLiaison_EstAutomatique] DEFAULT ((0)) NOT NULL,
    [IndConfirm]     BIT           CONSTRAINT [DF_Lsn_MLsnMLiaison_IndConfirm] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Lsn_MLsnMLiaison] PRIMARY KEY CLUSTERED ([CleMLiaison] ASC),
    CONSTRAINT [UN1_Lsn_MLsnMLiaison] UNIQUE NONCLUSTERED ([CodMLiaison] ASC)
);

