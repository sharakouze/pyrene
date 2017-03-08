CREATE TABLE [SA_TMPI].[Trp_Pnt_SecteurG] (
    [CleSecteurG]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleSecteurG_C] SMALLINT      NULL,
    [CleSecteurG_H] SMALLINT      NOT NULL,
    [CodSecteurG]   VARCHAR (50)  NOT NULL,
    [LibSecteurG]   VARCHAR (100) NOT NULL,
    [TxtSecteurG]   VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Trp_Pnt_SecteurG_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Trp_Pnt_SecteurG_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    CONSTRAINT [PK_Trp_PntSecteurG] PRIMARY KEY CLUSTERED ([CleSecteurG] ASC),
    CONSTRAINT [UN_Trp_PntSecteurG] UNIQUE NONCLUSTERED ([CodSecteurG] ASC)
);

