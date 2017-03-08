CREATE TABLE [SA_TMPI].[LmsP_Par_ForLigne] (
    [CleFormule]    SMALLINT       NOT NULL,
    [CleForLigne]   INT            IDENTITY (1, 1) NOT NULL,
    [NumLigne]      TINYINT        NULL,
    [TxtLigne]      VARCHAR (500)  NULL,
    [TxtLigneC]     VARCHAR (500)  NULL,
    [TxtCondition]  VARCHAR (500)  NULL,
    [TxtConditionC] VARCHAR (500)  NULL,
    [LstParametre]  VARCHAR (500)  NULL,
    [EstACompiler]  BIT            CONSTRAINT [DF_LmsP_Par_ForLigne_EstACompiler] DEFAULT ((1)) NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_LmsP_Par_ForLigne_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_LmsP_Par_ForLigne_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_LmsP_Par_ForLigne_CleCreateur] DEFAULT ((0)) NOT NULL,
    [LstValeur]     VARCHAR (2000) NULL,
    CONSTRAINT [FK1_LmsP_Par_ForLigne] FOREIGN KEY ([CleFormule]) REFERENCES [SA_TMPI].[LmsP_Par_Formule] ([CleFormule])
);

