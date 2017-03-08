CREATE TABLE [SA_TMPI].[Trp_PrcProcedure] (
    [CleProcedure]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleProcedure_C]  SMALLINT      NOT NULL,
    [CleProcedure_H]  SMALLINT      NOT NULL,
    [CodProcedure]    VARCHAR (50)  NOT NULL,
    [LibProcedure]    VARCHAR (100) NOT NULL,
    [TxtProcedure]    VARCHAR (255) NULL,
    [EstActif]        BIT           CONSTRAINT [DF_Trp_PrcProcedure_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Trp_PrcProcedure_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModification] SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [CleValideur]     SMALLINT      NULL,
    [CleExterne]      INT           NULL,
    [CleOrigine]      TINYINT       NULL,
    CONSTRAINT [PK_Trp_PrcProcedure] PRIMARY KEY CLUSTERED ([CleProcedure] ASC),
    CONSTRAINT [UN_Trp_PrcProcedure] UNIQUE NONCLUSTERED ([CodProcedure] ASC)
);

