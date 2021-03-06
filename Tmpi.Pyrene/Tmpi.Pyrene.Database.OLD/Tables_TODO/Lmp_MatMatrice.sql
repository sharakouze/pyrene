﻿CREATE TABLE [SA_TMPI].[Lmp_MatMatrice] (
    [CleSecteur]    SMALLINT       NULL,
    [CleFamille]    SMALLINT       NULL,
    [CleClasse]     SMALLINT       NULL,
    [CleMatrice]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleMatrice_C]  SMALLINT       NULL,
    [CleMatrice_H]  SMALLINT       NULL,
    [CodMatrice]    NVARCHAR (50)  NOT NULL,
    [LibMatrice]    VARCHAR (400)  NOT NULL,
    [TxtMatrice]    NVARCHAR (255) NULL,
    [EstGenerique]  BIT            CONSTRAINT [DF_Lmp_MatMatrice_EstGenerique] DEFAULT ((0)) NOT NULL,
    [CleMatrice_G]  SMALLINT       CONSTRAINT [DF_Lmp_MatMatrice_CleMatrice_G] DEFAULT ((0)) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_MatMatrice_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_MatMatrice_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Lmp_MatMatrice_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    [CleEspece]     SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    CONSTRAINT [PK_Lmp_MatMatrice] PRIMARY KEY CLUSTERED ([CleMatrice] ASC),
    CONSTRAINT [FK1_Lmp_MatMatrice] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_MatMatrice] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_Lmp_MatMatrice] UNIQUE NONCLUSTERED ([CodMatrice] ASC)
);

