CREATE TABLE [SA_TMPI].[Trn_Pnt_Nature] (
    [CleFamille]      SMALLINT      NOT NULL,
    [TypPoint]        TINYINT       NOT NULL,
    [CleNature]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodNature]       VARCHAR (50)  NOT NULL,
    [LibNature]       VARCHAR (100) NOT NULL,
    [TxtNature]       VARCHAR (255) NULL,
    [EstActif]        BIT           CONSTRAINT [DF_Trn_Pnt_Nature_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Trn_Pnt_Nature_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModification] SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [CleValideur]     SMALLINT      NULL,
    CONSTRAINT [PK_Trn_Pnt_Nature] PRIMARY KEY CLUSTERED ([CleNature] ASC),
    CONSTRAINT [UN_Trn_Pnt_Nature] UNIQUE NONCLUSTERED ([CodNature] ASC)
);

