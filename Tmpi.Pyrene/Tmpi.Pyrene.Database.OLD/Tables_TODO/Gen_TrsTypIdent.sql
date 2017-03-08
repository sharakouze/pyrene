CREATE TABLE [SA_TMPI].[Gen_TrsTypIdent] (
    [CleTypIdent]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodTypIdent]   VARCHAR (50)  NOT NULL,
    [LibTypIdent]   VARCHAR (100) NOT NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_TrsTypIdent_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_TrsTypIdent_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Gen_TrsTypIdent_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    TINYINT       NULL,
    [TxtTypIdent]   VARCHAR (255) NULL,
    CONSTRAINT [PK_Gen_TrsTypIdent] PRIMARY KEY CLUSTERED ([CleTypIdent] ASC),
    CONSTRAINT [UN_Gen_TrsTypeIdent] UNIQUE NONCLUSTERED ([CodTypIdent] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsTypIdent]
    ON [SA_TMPI].[Gen_TrsTypIdent]([CodTypIdent] ASC);

