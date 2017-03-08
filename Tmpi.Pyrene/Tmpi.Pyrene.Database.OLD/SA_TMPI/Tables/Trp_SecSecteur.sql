CREATE TABLE [SA_TMPI].[Trp_SecSecteur] (
    [CleSecteur]         SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodSecteur]         VARCHAR (50)   NOT NULL,
    [LibSecteur]         VARCHAR (100)  NOT NULL,
    [TxtSecteur]         VARCHAR (255)  NULL,
    [EstActif]           BIT            CONSTRAINT [DF_Trp_SecSecteur_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF_Trp_SecSecteur_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [AdrCommune]         VARCHAR (80)   NULL,
    [NumInsee]           VARCHAR (25)   NULL,
    [AdrRue]             NVARCHAR (100) NULL,
    [NbrTacheMax]        TINYINT        NOT NULL,
    [CleCalendrier_H]    SMALLINT       NULL,
    [CleCalendrier_C]    SMALLINT       NULL,
    [EstSynchroOptiTime] BIT            NULL,
    [CodPostal]          VARCHAR (10)   NULL,
    CONSTRAINT [PK_Trn_SecSecteur] PRIMARY KEY CLUSTERED ([CleSecteur] ASC),
    CONSTRAINT [UN_Trn_SecSecteur] UNIQUE NONCLUSTERED ([CodSecteur] ASC)
);

