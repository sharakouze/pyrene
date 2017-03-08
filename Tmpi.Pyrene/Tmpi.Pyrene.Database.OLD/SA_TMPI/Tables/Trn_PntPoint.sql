CREATE TABLE [SA_TMPI].[Trn_PntPoint] (
    [ClePoint]               INT              IDENTITY (1, 1) NOT NULL,
    [NumPoint]               VARCHAR (25)     NOT NULL,
    [CleTypIdent]            SMALLINT         NOT NULL,
    [NomPoint]               VARCHAR (100)    NULL,
    [TypPoint]               TINYINT          CONSTRAINT [DF_Trn_PntPoint_TypPoint] DEFAULT ((0)) NOT NULL,
    [TxtPoint]               VARCHAR (255)    NULL,
    [CleClasse]              SMALLINT         NULL,
    [AdrRue]                 VARCHAR (100)    NULL,
    [AdrCommune]             VARCHAR (100)    NULL,
    [AdrComplement]          VARCHAR (255)    NULL,
    [NumInsee]               VARCHAR (25)     NULL,
    [AdrCoordonnee_0]        VARCHAR (25)     NULL,
    [AdrCoordonnee_1]        VARCHAR (25)     NULL,
    [CleGestionnaire]        INT              NULL,
    [NomGestionnaire]        VARCHAR (100)    NULL,
    [CleExploitant]          INT              NULL,
    [NomExploitant]          VARCHAR (100)    NULL,
    [NumEMail]               VARCHAR (100)    NULL,
    [ValDelai]               SMALLINT         NULL,
    [NomContact]             VARCHAR (50)     NULL,
    [NumTelep]               VARCHAR (25)     NULL,
    [EstActif]               BIT              CONSTRAINT [DF_Trn_PntPoint_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]            SMALLDATETIME    CONSTRAINT [DF_Trn_PntPoint_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]            INT              CONSTRAINT [DF_Trn_PntPoint_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]               SMALLDATETIME    NULL,
    [CleOperateur]           SMALLINT         NULL,
    [DatValidation]          SMALLDATETIME    NULL,
    [CleValideur]            SMALLINT         NULL,
    [CleOrigine]             INT              NULL,
    [CleExterne]             INT              NULL,
    [AdrLongitude_P]         DECIMAL (20, 13) NULL,
    [AdrLatitude_P]          DECIMAL (20, 13) NULL,
    [AdrLongitude_C]         DECIMAL (20, 13) NULL,
    [AdrLatitude_C]          DECIMAL (20, 13) NULL,
    [CleFamille]             SMALLINT         NULL,
    [CleNature]              SMALLINT         NULL,
    [CleSecteurG]            SMALLINT         CONSTRAINT [DF_Trn_PntPoint_CleSecteurG] DEFAULT ((0)) NULL,
    [ValHandicap]            TINYINT          CONSTRAINT [DF_Trn_PntPoint_ValHandicap] DEFAULT ((0)) NOT NULL,
    [TxtHandicap]            VARCHAR (255)    NULL,
    [CleProfil]              SMALLINT         NULL,
    [TypMedia]               TINYINT          CONSTRAINT [DF_Trn_PntPoint_TypMedia] DEFAULT ((0)) NULL,
    [ClePointP]              INT              NULL,
    [CleCalendrier]          SMALLINT         NULL,
    [EstHorairePersonnalise] BIT              CONSTRAINT [DF_Trn_PntPoint] DEFAULT ((0)) NOT NULL,
    [CleSecteurT]            INT              NULL,
    [EstSynchroRMS]          BIT              CONSTRAINT [DF_TrnTrnPoint_EstSynchroRMS] DEFAULT ((0)) NOT NULL,
    [CodPostal]              VARCHAR (10)     NULL,
    [EstGeocodeManuel]       BIT              CONSTRAINT [DF_Trn_PntPoint_EstGeocodeManuel] DEFAULT ((0)) NOT NULL,
    [EstSynchroOptiTime]     BIT              NULL,
    [EstRVOblige]            BIT              CONSTRAINT [DF_Trn_PntPoint_EstRVOblige] DEFAULT ((0)) NOT NULL,
    [NivDegradation]         TINYINT          NULL,
    [EstRVAConfirmer]        BIT              CONSTRAINT [DF_Trn_PntPointEstRVAConfirmer] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Trn_PntPoint] PRIMARY KEY CLUSTERED ([ClePoint] ASC),
    CONSTRAINT [FK1_Trn_PntPoint] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Trp_Pnt_Famille] ([CleFamille]),
    CONSTRAINT [FK2_Trn_PntPoint] FOREIGN KEY ([CleProfil]) REFERENCES [SA_TMPI].[TrnP_Pnt_PrfProfil] ([CleProfil]),
    CONSTRAINT [Un_Trn_PntPoint] UNIQUE NONCLUSTERED ([CleTypIdent] ASC, [NumPoint] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntPoint]
    ON [SA_TMPI].[Trn_PntPoint]([NumPoint] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_PntPoint]
    ON [SA_TMPI].[Trn_PntPoint]([NomPoint] ASC);


GO
CREATE NONCLUSTERED INDEX [ID3_Trn_PntPoint]
    ON [SA_TMPI].[Trn_PntPoint]([AdrRue] ASC);


GO
CREATE NONCLUSTERED INDEX [ID4_Trn_PntPoint]
    ON [SA_TMPI].[Trn_PntPoint]([AdrCommune] ASC);

