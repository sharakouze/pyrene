CREATE TABLE [SA_TMPI].[Trn_Pnt_Habilitation] (
    [CleHabilitation] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [LibHabilitation] VARCHAR (255) NOT NULL,
    [TxtHabilitation] VARCHAR (255) NULL,
    [DatCreation]     SMALLDATETIME CONSTRAINT [DF_Trn_Pnt_Habilitation_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT      NOT NULL,
    [DatModification] SMALLDATETIME NULL,
    [CleOperateur]    SMALLINT      NULL,
    [DatValidation]   SMALLDATETIME NULL,
    [CleValideur]     SMALLINT      NULL,
    CONSTRAINT [PK_Trn_Pnt_Habilitation] PRIMARY KEY CLUSTERED ([CleHabilitation] ASC)
);

