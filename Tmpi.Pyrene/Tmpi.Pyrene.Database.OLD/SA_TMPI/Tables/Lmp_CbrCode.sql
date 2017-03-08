CREATE TABLE [SA_TMPI].[Lmp_CbrCode] (
    [CleCode]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleCode_C]     SMALLINT      NULL,
    [CleCode_H]     SMALLINT      NOT NULL,
    [CodCode]       VARCHAR (50)  NOT NULL,
    [LibCode]       VARCHAR (100) NOT NULL,
    [TxtCode]       VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_CbrCode_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_CbrCode_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_CbrCode_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    [CodProcedure]  VARCHAR (100) NULL,
    CONSTRAINT [PK_Lmp_CbrCode] PRIMARY KEY CLUSTERED ([CleCode] ASC),
    CONSTRAINT [UN_GenP_CbrCode] UNIQUE NONCLUSTERED ([CodCode] ASC)
);

