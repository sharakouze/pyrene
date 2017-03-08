﻿CREATE TABLE [SA_TMPI].[Lmp_AnlAnalyte] (
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    [CleFamille]    SMALLINT       CONSTRAINT [DF_Lmp_AnlAnalyte_CleFamille] DEFAULT ((0)) NULL,
    [CleAnalyte]    SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleAnalyte_C]  SMALLINT       NULL,
    [CleAnalyte_H]  SMALLINT       NULL,
    [CodAnalyte]    NVARCHAR (50)  NOT NULL,
    [AbvAnalyte]    VARCHAR (10)   NULL,
    [LibAnalyte]    NVARCHAR (100) NOT NULL,
    [LibAnalyte_I]  VARCHAR (100)  NULL,
    [TxtAnalyte]    NVARCHAR (255) NULL,
    [EstGenerique]  BIT            CONSTRAINT [DF_Lmp_AnlAnalyte_EstGenerique] DEFAULT ((0)) NOT NULL,
    [CleAnalyte_G]  SMALLINT       CONSTRAINT [DF_Lmp_AnlAnalyte_CleAnalyte_G] DEFAULT ((0)) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_AnlAnalyte_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_AnlAnalyte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Lmp_AnlAnalyte_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    [CleMaladie]    SMALLINT       NULL,
    CONSTRAINT [PK_Lmp_AnlAnalyte] PRIMARY KEY CLUSTERED ([CleAnalyte] ASC),
    CONSTRAINT [FK_Lmp_AnlAnalyte_AnlAnalyteG] FOREIGN KEY ([CleAnalyte_G]) REFERENCES [SA_TMPI].[Lmp_AnlAnalyte] ([CleAnalyte]),
    CONSTRAINT [FK1_Lmp_AnlAnalyte] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_AnlAnalyte] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_Lmp_AnlAnalyte] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Lmp_Anl_Famille] ([CleFamille]),
    CONSTRAINT [UN_Lmp_AnlAnalyte] UNIQUE NONCLUSTERED ([CodAnalyte] ASC)
);

