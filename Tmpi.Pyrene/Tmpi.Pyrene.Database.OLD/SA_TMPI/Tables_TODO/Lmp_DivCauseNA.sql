CREATE TABLE [SA_TMPI].[Lmp_DivCauseNA] (
    [CleCauseNA]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleCauseNA_C]  SMALLINT      NULL,
    [CleCauseNA_H]  SMALLINT      NOT NULL,
    [CodCauseNA]    VARCHAR (50)  NOT NULL,
    [LibCauseNA]    VARCHAR (100) NOT NULL,
    [TxtCauseNA]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_DivCauseNA_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_DivCauseNA_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_DivCauseNA_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    [CleSecteur]    SMALLINT      NULL,
    [CleService]    SMALLINT      NULL,
    CONSTRAINT [PK_Lmp_DivCauseNA] PRIMARY KEY CLUSTERED ([CleCauseNA] ASC),
    CONSTRAINT [FK1_Lmp_DivCauseNA] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_DivCauseNA] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Lmp_DivCauseNA] UNIQUE NONCLUSTERED ([CodCauseNA] ASC)
);

