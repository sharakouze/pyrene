﻿CREATE TABLE [SA_TMPI].[Gen_SocService] (
    [CleSociete]    SMALLINT      NULL,
    [CleSecteur]    SMALLINT      NULL,
    [CleService]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleService_C]  SMALLINT      NULL,
    [CleService_H]  SMALLINT      NOT NULL,
    [CodService]    VARCHAR (50)  NOT NULL,
    [LibService]    VARCHAR (100) NOT NULL,
    [TxtService]    VARCHAR (255) NULL,
    [AdrRue]        VARCHAR (100) NULL,
    [AdrCode]       VARCHAR (10)  NULL,
    [AdrVille]      VARCHAR (50)  NULL,
    [NumTelep]      VARCHAR (25)  NULL,
    [NumTelec]      VARCHAR (25)  NULL,
    [NumEMail]      VARCHAR (50)  NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_SocService_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_SocService_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Gen_SocService_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleOrigine]    TINYINT       NULL,
    [CleExterne]    INT           NULL,
    [CleDevise]     TINYINT       NULL,
    CONSTRAINT [PK_Gen_SocService] PRIMARY KEY CLUSTERED ([CleService] ASC),
    CONSTRAINT [FK1_Gen_SocService] FOREIGN KEY ([CleSociete]) REFERENCES [SA_TMPI].[Gen_SocSociete] ([CleSociete]),
    CONSTRAINT [FK2_Gen_SocService] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [UN1_Gen_SocService] UNIQUE NONCLUSTERED ([CodService] ASC, [CleService_H] ASC)
);

