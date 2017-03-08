CREATE TABLE [SA_TMPI].[Gen_Res_Type] (
    [CleTypRessource] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodTypRessource] VARCHAR (50)  NULL,
    [LibTypRessource] VARCHAR (100) NULL,
    [TxtTypRessource] VARCHAR (255) NULL,
    [EstActif]        BIT           CONSTRAINT [DF_Gen_Res_Type_EstActif] DEFAULT ((1)) NOT NULL,
    [CleFamille]      TINYINT       NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Gen_Res_Type_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     INT           NOT NULL,
    [DatModif]        SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [CleValideur]     SMALLINT      NULL,
    CONSTRAINT [PK_Gen_Res_Type] PRIMARY KEY CLUSTERED ([CleTypRessource] ASC),
    CONSTRAINT [UN_Gen_Res_Type] UNIQUE NONCLUSTERED ([CodTypRessource] ASC)
);

