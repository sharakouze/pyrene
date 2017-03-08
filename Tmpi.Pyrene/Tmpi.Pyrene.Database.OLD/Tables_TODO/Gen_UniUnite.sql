CREATE TABLE [SA_TMPI].[Gen_UniUnite] (
    [CleUnite]      SMALLINT        IDENTITY (1, 1) NOT NULL,
    [CleUnite_C]    SMALLINT        NULL,
    [CleUnite_H]    SMALLINT        NOT NULL,
    [CleFamille]    SMALLINT        NULL,
    [CodUnite]      VARCHAR (50)    NOT NULL,
    [LibUnite]      VARCHAR (100)   NOT NULL,
    [TxtUnite]      VARCHAR (255)   NULL,
    [TauConversion] DECIMAL (12, 6) CONSTRAINT [DF_Gen_UniUnite_TauConversion] DEFAULT ((1)) NOT NULL,
    [EstActif]      BIT             CONSTRAINT [DF_Gen_UniUnite_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME   CONSTRAINT [DF_Gen_UniUnite_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT        NOT NULL,
    [DatModif]      SMALLDATETIME   NULL,
    [CleOperateur]  SMALLINT        NULL,
    [DatValidation] SMALLDATETIME   NULL,
    [CleValideur]   SMALLINT        NULL,
    [CleExterne]    INT             NULL,
    [CleOrigine]    TINYINT         NULL,
    [CleUnite_Ref]  SMALLINT        NOT NULL,
    CONSTRAINT [PK_Gen_UniUnite] PRIMARY KEY CLUSTERED ([CleUnite] ASC),
    CONSTRAINT [UN_Gen_UniUnite] UNIQUE NONCLUSTERED ([CleUnite_H] ASC, [CodUnite] ASC)
);

