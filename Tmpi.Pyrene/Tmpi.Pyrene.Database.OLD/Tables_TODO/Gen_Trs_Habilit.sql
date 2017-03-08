CREATE TABLE [SA_TMPI].[Gen_Trs_Habilit] (
    [CleHabilit]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleHabilit_C]  SMALLINT      NULL,
    [CleHabilit_H]  SMALLINT      NOT NULL,
    [CodHabilit]    VARCHAR (50)  NOT NULL,
    [LibHabilit]    VARCHAR (100) NOT NULL,
    [TxtHabilit]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_Trs_Habilit_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_Trs_Habilit_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    TINYINT       NULL,
    CONSTRAINT [PK_Gen_Trs_Habilit] PRIMARY KEY CLUSTERED ([CleHabilit] ASC),
    CONSTRAINT [UN_Gen_Trs_Habilit] UNIQUE NONCLUSTERED ([CleHabilit_H] ASC, [CodHabilit] ASC)
);

