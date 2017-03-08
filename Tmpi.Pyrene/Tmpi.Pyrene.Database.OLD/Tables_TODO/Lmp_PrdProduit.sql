﻿CREATE TABLE [SA_TMPI].[Lmp_PrdProduit] (
    [CleClasse]         SMALLINT      NULL,
    [CleProduit]        SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleProduit_C]      SMALLINT      NULL,
    [CleProduit_H]      SMALLINT      NULL,
    [CodProduit]        VARCHAR (50)  NOT NULL,
    [AbvProduit]        VARCHAR (10)  NULL,
    [LibProduit]        VARCHAR (200) NOT NULL,
    [TxtProduit]        VARCHAR (255) NULL,
    [CleMNumero]        SMALLINT      NULL,
    [CleValidation]     SMALLINT      NULL,
    [CleReferentiel]    SMALLINT      NULL,
    [CleSpecification]  INT           NULL,
    [EstGenerique]      BIT           CONSTRAINT [DF_Lmp_PrdProduit_EstGenerique] DEFAULT ((0)) NOT NULL,
    [CleProduit_G]      SMALLINT      CONSTRAINT [DF_Lmp_PrdProduit_CleProduit_G] DEFAULT ((0)) NULL,
    [CleQualification]  TINYINT       CONSTRAINT [DF_Lmp_PrdProduit_CleQualification] DEFAULT ((0)) NULL,
    [DurPrelevement]    SMALLINT      NULL,
    [ValContrainteLect] TINYINT       NULL,
    [EstActif]          BIT           CONSTRAINT [DF_Lmp_PrdProduit_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME CONSTRAINT [DF_Lmp_PrdProduit_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       INT           CONSTRAINT [DF_Lmp_PrdProduit_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]          SMALLDATETIME NULL,
    [CleOperateur]      SMALLINT      NULL,
    [DatValidation]     SMALLDATETIME NULL,
    [CleValideur]       SMALLINT      NULL,
    [CleExterne]        INT           NULL,
    [CleOrigine]        INT           NULL,
    [CleQualif]         SMALLINT      NULL,
    [CleMNumero_E]      SMALLINT      NULL,
    [CleSecteur]        SMALLINT      NULL,
    [CleService]        SMALLINT      NULL,
    [CleListe]          SMALLINT      NULL,
    [TypInterpretation] SMALLINT      NULL,
    [TypValidation]     SMALLINT      NULL,
    [LibProduit_I]      VARCHAR (200) NULL,
    CONSTRAINT [PK_Lmp_PrdProduit] PRIMARY KEY CLUSTERED ([CleProduit] ASC),
    CONSTRAINT [FK_Lmp_PrdProduit_Cpt_MNumero] FOREIGN KEY ([CleMNumero]) REFERENCES [SA_TMPI].[Gen_Cpt_MNumero] ([CleMNumero]),
    CONSTRAINT [FK1_Lmp_PrdProduit] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_PrdProduit] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Lmp_PrdProduit] UNIQUE NONCLUSTERED ([CodProduit] ASC)
);
