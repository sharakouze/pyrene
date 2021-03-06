﻿CREATE TABLE [SA_TMPI].[Lmp_SrtExport] (
    [TypExport]     TINYINT       NOT NULL,
    [CleExport]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleExport_C]   SMALLINT      NULL,
    [CleExport_H]   SMALLINT      NOT NULL,
    [CodExport]     VARCHAR (50)  NOT NULL,
    [LibExport]     VARCHAR (100) NOT NULL,
    [TxtExport]     VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Lmp_SrtExport_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Lmp_SrtExport_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Lmp_SrtExport_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    SMALLINT      NULL,
    [CleSecteur]    SMALLINT      NULL,
    [CleService]    SMALLINT      NULL,
    CONSTRAINT [PK_Lmp_SrtExport] PRIMARY KEY CLUSTERED ([CleExport] ASC),
    CONSTRAINT [FK1_Lmp_SrtExport] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_SrtExport] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Lmp_SrtExport] UNIQUE NONCLUSTERED ([CodExport] ASC)
);

